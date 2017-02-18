_sounds = [(missionConfigFile >> "cfgFactions" >> uo_missionParam_OPFORFACTION >> "propagandaTowerSounds"),"array",[]] call CBA_fnc_getConfigEntry;
if (count _sounds == 0) exitWith {};

if (isServer) then {
    uo_propagandaTower_activeTowers = [];
    [] call uo_buyables_fnc_propagandaTowerPlaySoundsPFH;
};

if (!hasInterface) exitWith {};

_action = ["uo_propagandaTower_mainNode", "", "",{},{alive (_this select 0)},{},[],[0,0,-2],3.5] call ace_interact_menu_fnc_createAction;
["Land_Loudspeakers_F",0,[],_action,false] call ace_interact_menu_fnc_addActionToClass;

_condition = {
    side (_this select 1) == EAST &&
    {[_this select 0] call uo_common_fnc_isMissionObject} &&
    {!((_this select 0) getVariable ["uo_propagandaTower_isPlaying",false])} &&
    {!((_this select 0) getVariable ["uo_propagandaTower_isDestroyed",false])}
};
_action = ["uo_propagandaTower_on", "Play propaganda", "\A3\ui_f\data\igui\cfg\actions\ico_ON_ca.paa",{_this remoteExec ["uo_buyables_fnc_propagandaTowerSetActive",2,false]},_condition,{},[true]] call ace_interact_menu_fnc_createAction;
["Land_Loudspeakers_F",0,["uo_propagandaTower_mainNode"],_action,false] call ace_interact_menu_fnc_addActionToClass;

_condition = {
    side (_this select 1) == EAST &&
    {[_this select 0] call uo_common_fnc_isMissionObject} &&
    {(_this select 0) getVariable ["uo_propagandaTower_isPlaying",false]} &&
    {!((_this select 0) getVariable ["uo_propagandaTower_isDestroyed",false])}
};
_action = ["uo_propagandaTower_off", "Stop propaganda", "\A3\ui_f\data\igui\cfg\actions\ico_OFF_ca.paa",{_this remoteExec ["uo_buyables_fnc_propagandaTowerSetActive",2,false]},_condition,{},[false]] call ace_interact_menu_fnc_createAction;
["Land_Loudspeakers_F",0,["uo_propagandaTower_mainNode"],_action,false] call ace_interact_menu_fnc_addActionToClass;

_condition = {
    side (_this select 1) == WEST &&
    {[_this select 0] call uo_common_fnc_isMissionObject} &&
    {(_this select 0) getVariable ["uo_propagandaTower_isPlaying",false]} &&
    {!((_this select 0) getVariable ["uo_propagandaTower_isDestroyed",false])}
};
_action = ["uo_propagandaTower_destroy", "Destroy propaganda tower", "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa",uo_buyables_fnc_propagandaTowerDestroy,_condition] call ace_interact_menu_fnc_createAction;
["Land_Loudspeakers_F",0,["uo_propagandaTower_mainNode"],_action,false] call ace_interact_menu_fnc_addActionToClass;
