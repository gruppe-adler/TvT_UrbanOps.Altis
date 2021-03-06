#define PREFIX uo
#define COMPONENT endings
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};
if (uo_missionParam_PRESET == "DEBUG") exitWith {};

uo_fnc_checkBluKilled_preEliminated = {
    [{
        if (({side _x == west} count playableUnits) == 0) then {
            if ({_x getVariable ["uo_respawnObject_isActive", false]} count uo_cv_allCVs == 0 || !uo_missionParam_BLUFORRESPAWNENABLED || {uo_missionParam_DEFENSETIME - (serverTime - uo_init_gameStartTime) < WAVERESPAWNTIMELEFTBLU}) then {
                INFO("All commandvehicles inactive.");
                [] call uo_fnc_checkBluKilled_eliminated;
                [_this select 1] call CBA_fnc_removePerFrameHandler;
            };
        };
    } , 5, []] call CBA_fnc_addPerFrameHandler;
};

uo_fnc_checkBluKilled_eliminated = {
    [{
        if (({side _x == west} count playableUnits) == 0) then {
            _downSince = missionNamespace getVariable ["uo_bluDownSince", 0];
            missionNamespace setVariable ["uo_bluDownSince", _downSince + 1];
        } else {
            missionNamespace setVariable ["uo_bluDownSince", 0];
            [] call uo_fnc_checkBluKilled_preEliminated;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

        if (missionNamespace getVariable ["uo_bluDownSince", 0] > 15 || !uo_missionParam_BLUFORRESPAWNENABLED || {uo_missionParam_DEFENSETIME - (serverTime - uo_init_gameStartTime) < WAVERESPAWNTIMELEFTBLU}) then {

            if (missionNamespace getVariable ["uo_endInProgressServer", false]) exitWith {INFO("A different ending is already in progress.")};
            uo_endInProgressServer = true;

            if (uo_missionParams_RANKEDMODE) then {
                uo_missionStats = [uo_teammembersOpfor,uo_teammembersBlufor,["OPFOR"],["BLUFOR"]] call grad_winrateTracker_fnc_saveWinrate;
                publicVariable "uo_missionStats";
            };

            [uo_missionstart_defendTask,"SUCCEEDED",false] call BIS_fnc_taskSetState;
            [uo_missionstart_captureTask,"FAILED",false] call BIS_fnc_taskSetState;

            ["EAST", "BLUFOR ELIMINATED!"] call FUNC(endMissionServer);            
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    } , 1, []] call CBA_fnc_addPerFrameHandler;
};

[] call uo_fnc_checkBluKilled_preEliminated;
