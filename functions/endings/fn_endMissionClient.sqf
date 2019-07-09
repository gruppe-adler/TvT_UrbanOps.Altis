#define PREFIX uo
#define COMPONENT endings
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!hasInterface) exitWith {};

if (missionNamespace getVariable ["uo_endInProgressClient", false]) exitWith {INFO("A different ending is already in progress.")};
uo_endInProgressClient = true;

_this spawn {
    waitUntil {missionNamespace getVariable ["REPLAY_FINISHED",false]};

    private _isVictory = if (_winningSide == (player getVariable ["originalSide", "UNKNOWN"])) then {true} else {false};
    [{["end1", _this select 0, true, true, true] spawn BIS_fnc_endMission}, [_isVictory], 5] call CBA_fnc_waitAndExecute;
};
