_sounds = [(missionConfigFile >> "cfgFactions" >> uo_missionParam_OPFORFACTION >> "propagandaTowerSounds"),"array",[]] call CBA_fnc_getConfigEntry;

_play = {
    params ["_sounds"];

    _activeTowers = missionNamespace getVariable ["uo_propagandaTower_activeTowers",[]];
    if (count _activeTowers == 0) exitWith {};

    if (60 < random 100) then {
        [_activeTowers,selectRandom _sounds] remoteExec ["uo_buyables_fnc_propagandaTowerPlaySounds",0,false];
    };
};
[_play,300,_sounds] call CBA_fnc_addPerFrameHandler;
