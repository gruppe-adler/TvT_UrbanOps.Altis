params ["_cv"];

if (!hasInterface) exitWith {};
if (isNil "_cv") exitWith {};
if (isNull _cv) exitWith {};


[_cv,"blu_" + BLUFORFACTION,_cv,_cv,"COMMANDVEHICLE","Buy Equipment", {side player == WEST}] call grad_lbm_fnc_addInteraction;
