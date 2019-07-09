params ["_unit","_pos",["_createMarker",false]];

if (!local _unit) exitWith {};

_unit allowDamage false;
_unit setPos _pos;
[{_this allowDamage true}, _unit, 2] call CBA_fnc_waitAndExecute;

[] call uo_waverespawn_fnc_onPlayerRespawn;

if (_createMarker) then {
    private _m = createMarkerLocal [format ["opfrespawn_local_%1",CBA_missionTime],_pos];
    _m setMarkerType "hd_start";
    _m setMarkerColor "COLOREAST";
    _m setMarkerText format ["RESPAWN (%1)",daytime call BIS_fnc_timeToString];

    [{
        params ["_m","_handle"];

        private _currentAlpha = markerAlpha _m;
        if (_currentAlpha <= 0.5) exitWith {
            deleteMarkerLocal _m;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        _m setMarkerAlphaLocal (_currentAlpha - 0.05);
    },10,_m] call CBA_fnc_addPerFrameHandler;
};
