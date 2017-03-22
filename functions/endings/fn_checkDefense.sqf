#define PREFIX uo
#define COMPONENT endings
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};

INFO_1("Defense time check starting... OPFOR has to defend for %1s", uo_missionParam_DEFENSETIME);
uo_endings_defenseTimeLeft = uo_missionParam_DEFENSETIME;

uo_endings_fnc_checkDefense_addPFH = {
    uo_endings_defenseTimeLeft_lastTickTime = CBA_missionTime;

    [{
        uo_endings_defenseTimeLeft = uo_endings_defenseTimeLeft - (CBA_missionTime - uo_endings_defenseTimeLeft_lastTickTime);
        uo_endings_defenseTimeLeft_lastTickTime = CBA_missionTime;
        uo_endings_defenseTimeLeft = uo_endings_defenseTimeLeft max 0;
        publicVariable "uo_endings_defenseTimeLeft";

        if (round uo_endings_defenseTimeLeft in [900,600,300,60]) then {
            _text = format ["%1 left in the round.",[(round (uo_endings_defenseTimeLeft/60))*60,"MM:SS"] call BIS_fnc_secondsToString];
            ["uo_notification",["URBAN OPS",_text]] remoteExec ["bis_fnc_showNotification",0,false];
        };

        if (uo_endings_defenseTimeLeft > 0) exitWith {};

        [_this select 1] call CBA_fnc_removePerFrameHandler;

        [{!BLUFORINCONTROL || uo_endings_defenseTimeLeft > 0}, {
            if (uo_endings_defenseTimeLeft > 0) exitWith {[] call uo_endings_fnc_checkDefense_addPFH};

            if (missionNamespace getVariable ["uo_endInProgressServer", false]) exitWith {INFO("A different ending is already in progress.")};
            uo_endInProgressServer = true;

            if (uo_missionParams_RANKEDMODE) then {
                uo_missionStats = [uo_teammembersOpfor,uo_teammembersBlufor,["OPFOR"],["BLUFOR"]] call grad_winrateTracker_fnc_saveWinrate;
                publicVariable "uo_missionStats";
            };

            [uo_missionstart_defendTask,"SUCCEEDED",false] call BIS_fnc_taskSetState;
            [uo_missionstart_captureTask,"FAILED",false] call BIS_fnc_taskSetState;
            missionNamespace setVariable ["uo_gameEnded", ["EAST","CITY DEFENDED!"], true];
            INFO("OPFOR has defended the location.");
        }, []] call CBA_fnc_waitUntilAndExecute;
    } , 1, []] call CBA_fnc_addPerFrameHandler;
};

[] call uo_endings_fnc_checkDefense_addPFH;
