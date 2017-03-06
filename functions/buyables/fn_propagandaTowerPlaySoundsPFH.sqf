_sounds = [(missionConfigFile >> "cfgFactions" >> uo_missionParam_OPFORFACTION >> "propagandaTowerSounds"),"array",[]] call CBA_fnc_getConfigEntry;

_play = {
    params ["_sounds"];

    _activeTowers = missionNamespace getVariable ["uo_propagandaTower_activeTowers",[]];
    _activeTowers = _activeTowers select {alive _x && !(_x getVariable ["uo_propagandaTower_isDestroyed",false]) && _x getVariable ["uo_propagandaTower_isPlaying",false]};
    if (count _activeTowers == 0) exitWith {};

    [_activeTowers,selectRandom _sounds] remoteExec ["uo_buyables_fnc_propagandaTowerPlaySounds",0,false];
};
[_play,270,_sounds] call CBA_fnc_addPerFrameHandler;
