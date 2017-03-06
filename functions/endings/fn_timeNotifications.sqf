#define PREFIX uo
#define COMPONENT endings
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_waitTime"];
[{
    _timeLeft = uo_missionParam_DEFENSETIME - (CBA_missionTime - uo_init_gameStartTime);
    if (_timeLeft < 0) exitWith {};
    INFO_1("%1s left in the round.");

    _text = format ["%1 left in the round.",[(round (_timeLeft/60))*60,"MM:SS"] call BIS_fnc_secondsToString];
    ["uo_notification",["URBAN OPS",_text]] remoteExec ["bis_fnc_showNotification",0,false];

    _nextWaitTime = _timeLeft - ((floor ((_timeLeft / 60) / 2)) * 60);
    if (_nextWaitTime > 60) then {
        [_nextWaitTime] call uo_endings_fnc_timeNotifications;
    };
}, [], _waitTime] call CBA_fnc_waitAndExecute;
