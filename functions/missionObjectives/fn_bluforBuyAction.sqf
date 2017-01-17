params ["_cv"];

if (!hasInterface) exitWith {};
if (isNil "_cv") exitWith {};
if (isNull _cv) exitWith {};


[_cv,"blu_" + uo_missionParam_BLUFORFACTION,_cv,_cv,"COMMANDVEHICLE","Buy Equipment", {side (_this select 1) == WEST && !((_this select 0) getVariable ["uo_respawnObject_isDestroyed",false])}] call grad_lbm_fnc_addInteraction;



//access opfor menu from commandvehicle (for debug purposes)
/*[_cv,"opf_" + uo_missionParam_OPFORFACTION,_cv,_cv,"COMMANDVEHICLE","Buy Equipment", {side player == WEST}] call grad_lbm_fnc_addInteraction;*/
