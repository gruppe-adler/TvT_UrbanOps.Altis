#define PREFIX uo
#define COMPONENT endings
#include "\x\cba\addons\main\script_macros_mission.hpp"


if (!isServer) exitWith {};

INFO_1("Defense time check starting... OPFOR has to defend for %1s", uo_missionParam_DEFENSETIME);

[{
    [{!BLUFORINCONTROL}, {
        if (missionNamespace getVariable ["uo_endInProgressServer", false]) exitWith {INFO("A different ending is already in progress.")};
        uo_endInProgressServer = true;

        if (uo_missionParams_RANKEDMODE) then {
            uo_missionStats = [uo_teammembersOpfor,uo_teammembersBlufor,["OPFOR"],["BLUFOR"]] call grad_winrateTracker_fnc_saveWinrate;
            publicVariable "uo_missionStats";
        };
        
        missionNamespace setVariable ["uo_gameEnded", ["EAST","CITY DEFENDED!"], true];
        INFO("OPFOR has defended the location.");
    }, []] call CBA_fnc_waitUntilAndExecute;
}, [], uo_missionParam_DEFENSETIME] call CBA_fnc_waitAndExecute;
