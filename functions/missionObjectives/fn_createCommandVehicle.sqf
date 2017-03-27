#define PREFIX uo
#define COMPONENT missionObjectives
#include "\x\cba\addons\main\script_macros_mission.hpp"


if (!isServer) exitWith {};

params ["_searchPos"];

_cvClass = [] call uo_missionObjectives_fnc_getCommandVehicleClass;

_pos = _searchPos findEmptyPosition [0,150,_cvClass];
if (str _pos == "[]") then {_pos = _searchPos};

//create task
_taskDescription = "Defend your Commandvehicle(s). If a Commandvehicle is destroyed, you will no longer be able to respawn on it and you will have less time to capture the location.";
uo_missionstart_defendCVTask = [WEST,"uo_missionstart_defendCVTask",[_taskDescription,"Defend Commandvehicles",""],objNull,"AUTOASSIGNED",3,false,"defend"] call BIS_fnc_taskCreate;

//spawn vehicle
_cv = _cvClass createVehicle _pos;
[{!isNull (_this select 0)}, {
    params ["_cv"];

    [_cv] call uo_missionObjectives_fnc_setCommandVehicle;
    INFO_1("Command vehicle %1 created.", _cv);
    missionNamespace setVariable ["uo_init_cvCreated", true, true];

}, [_cv]] call CBA_fnc_waitUntilAndExecute;
