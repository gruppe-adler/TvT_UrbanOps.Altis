#define PREFIX uo
#define COMPONENT missionObjectives
#include "\x\cba\addons\main\script_macros_mission.hpp"

params [["_faction",uo_missionParam_BLUFORFACTION]];

if (isNil "uo_missionParam_BLUFORFACTION" || isNil "uo_missionParam_ISWOODLAND") exitWith {""};

_cfg = missionConfigFile >> "CfgFactions" >> _faction;
_cvs = getArray (_cfg >> "commandVehicles");

_camo = if (uo_missionParam_ISWOODLAND) then {0} else {1};
_cvClass = _cvs select _camo;

_cvClass
