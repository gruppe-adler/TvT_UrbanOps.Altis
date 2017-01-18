#define PREFIX uo
#define COMPONENT setup
#include "\x\cba\addons\main\script_macros_mission.hpp"

_cfg = missionConfigFile >> "CfgFactions" >> uo_missionParam_BLUFORFACTION;
if (!isClass _cfg) exitWith {ERROR_1("%1 IS NOT A VALID FACTION.", uo_missionParam_BLUFORFACTION)};
_cvs = getArray (_cfg >> "commandVehicles");

_camo = if (uo_missionParam_ISWOODLAND) then {0} else {1};
COMMANDVEHICLECLASS = _cvs select _camo;
publicVariable "COMMANDVEHICLECLASS";
