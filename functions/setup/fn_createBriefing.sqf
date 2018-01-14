#define PREFIX uo
#define COMPONENT setup
#include "\x\cba\addons\main\script_macros_mission.hpp"

if !(hasInterface) exitWith {};

private _playerFaction = [uo_missionParam_BLUFORFACTION,uo_missionParam_OPFORFACTION] select (playerSide == EAST);

if (_playerFaction == "ind_pmc_special") then {
    player createDiarySubject ["raven","RQ-11 Raven"];
    player createDiaryRecord ["raven",[localize "str_UO_ravenTitle", localize "str_UO_ravenUsage"]];
};
