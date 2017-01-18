#define PREFIX uo
#define COMPONENT missionObjectives
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};

SETUPTIMEREMAINING = uo_missionParam_SETUPTIME;
publicVariable "SETUPTIMEREMAINING";

[{!isNil "CITYPOSITION" && (missionNamespace getVariable ["uo_init_briefingDone", false])}, {
    INFO("Setup countdown starting...");
    _countdown = {
        SETUPTIMEREMAINING = SETUPTIMEREMAINING - 1;
        publicVariable "SETUPTIMEREMAINING";
        if (SETUPTIMEREMAINING <= 0) then {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    };
    [_countdown, 1, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
