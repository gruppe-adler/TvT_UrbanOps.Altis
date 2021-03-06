#define PREFIX uo
#define COMPONENT civs
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};

[{
    if (BLUFORINCONTROL) then {
        CAPTURETIMEREMAINING = CAPTURETIMEREMAINING - 1;
        publicVariable "CAPTURETIMEREMAINING";

        if (CAPTURETIMEREMAINING <= 0 && {{!(_x getVariable ["uo_flagPlaced",false])} count uo_flagPositionAreas == 0}) then {
            if (missionNamespace getVariable ["uo_endInProgressServer", false]) exitWith {INFO("A different ending is already in progress.")};
            uo_endInProgressServer = true;

            if (uo_missionParams_RANKEDMODE) then {
                uo_missionStats = [uo_teammembersBlufor,uo_teammembersOpfor,["BLUFOR"],["OPFOR"]] call grad_winrateTracker_fnc_saveWinrate;
                publicVariable "uo_missionStats";
            };

            [uo_missionstart_captureTask,"SUCCEEDED",false] call BIS_fnc_taskSetState;
            [uo_missionstart_defendTask,"FAILED",false] call BIS_fnc_taskSetState;
            ["WEST", "CITY CAPTURED!"] call EFUNC(endings,endMissionServer);
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    };
} , 1, []] call CBA_fnc_addPerFrameHandler;
