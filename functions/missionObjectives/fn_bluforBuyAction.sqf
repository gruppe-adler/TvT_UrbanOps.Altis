params ["_cv"];

if (!hasInterface) exitWith {};
if (isNil "_cv") exitWith {};
if (isNull _cv) exitWith {};

//buy action
[
    _cv,
    "blu_" + uo_missionParam_BLUFORFACTION,
    _cv,
    _cv,
    "COMMANDVEHICLE",
    "Buy equipment",
    {side (_this select 1) == WEST && alive (_this select 0) && !((_this select 0) getVariable ["uo_respawnObject_isDestroyed",false])}
] call grad_lbm_fnc_addInteraction;
