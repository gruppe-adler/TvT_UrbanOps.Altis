#define PREFIX uo
#define COMPONENT missionStart
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_side"];

if (!hasInterface) exitWith {};
if (playerSide != _side) exitWith {};

_faction = if (playerSide == WEST) then {uo_missionParam_BLUFORFACTION} else {uo_missionParam_OPFORFACTION};
_BFTenabled = ([missionConfigFile >> "cfgFactions" >> _faction >> "BFT", "number", 1] call  CBA_fnc_getConfigEntry) == 1;

INFO_2("BFT enabled for faction %1: %2",_faction,_BFTenabled);
ace_map_BFT_Enabled = _BFTenabled;
