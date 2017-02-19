#define INTERVAL    60

params ["_tower","_caller","_args"];
_args params ["_play"];

//exit if already playing
if (_play isEqualTo (_tower getVariable ["uo_propagandaTower_isPlaying",false])) exitWith {};
_tower setVariable ["uo_propagandaTower_isPlaying",_play,true];

//start
if (_play) then {
    _addScore = {
        params ["_tower","_handle"];

        if (!alive _tower || isNull _tower) exitWith {
            _tower setVariable ["uo_propagandaTower_isPlaying",false,true];
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        if (_tower getVariable ["uo_propagandaTower_isDestroyed",false]) exitWith {};

        if (CBA_missionTime - (_tower getVariable ["uo_propagandaTower_lastUpdateTime",CBA_missionTime]) > INTERVAL-1) then {
            _valueToAdd = (1 - (CITYPOSITION distance2D _tower)/CITYAREASIZE) /15;
            missionNamespace setVariable ["CIVSKILLEDBLU",(CIVSKILLEDBLU + _valueToAdd) min 8,true];
        };

        _tower setVariable ["uo_propagandaTower_lastUpdateTime",CBA_missionTime];
    };

    _pfh = [_addScore,INTERVAL,_tower] call CBA_fnc_addPerFrameHandler;
    _tower setVariable ["uo_propagandaTower_PFH",_pfh];
    uo_propagandaTower_activeTowers pushBack _tower;

//stop
} else {
    _pfh = _tower getVariable ["uo_propagandaTower_PFH",-1];
    [_pfh] call CBA_fnc_removePerFrameHandler;
    uo_propagandaTower_activeTowers = uo_propagandaTower_activeTowers - [_tower];
};
