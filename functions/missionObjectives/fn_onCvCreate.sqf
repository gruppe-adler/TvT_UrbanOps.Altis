params ["_cv"];

if (isNil "_cv") exitWith {};
if (isNull _cv) exitWith {};

_code = [missionConfigFile >> "CfgFactions" >> uo_missionParam_BLUFORFACTION,"onCommandVehicleCreate",""] call BIS_fnc_returnConfigEntry;
_cv call compile _code;
