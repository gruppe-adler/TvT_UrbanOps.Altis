#define PREFIX uo
#define COMPONENT endings
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};

uo_fnc_endByBluKilled_preEliminated = {
    [{
        if (({side _x == west} count playableUnits) == 0) then {
            INFO("All BLUFOR down.");
            if ({_x getVariable ["uo_respawnObject_isActive", false]} count uo_cv_allCVs == 0 || {uo_missionParam_DEFENSETIME - (serverTime - uo_init_gameStartTime) < WAVERESPAWNTIMELEFTBLU}) then {
                INFO("All commandvehicles inactive.");
                [] call uo_fnc_endByBluKilled_eliminated;
                [_this select 1] call CBA_fnc_removePerFrameHandler;
            };
        };
    } , 5, []] call CBA_fnc_addPerFrameHandler;
};

uo_fnc_endByBluKilled_eliminated = {
    [{
        if (({side _x == west} count playableUnits) == 0) then {
            _downSince = missionNamespace getVariable ["uo_bluDownSince", 0];
            missionNamespace setVariable ["uo_bluDownSince", _downSince + 1];
        } else {
            missionNamespace setVariable ["uo_bluDownSince", 0];
            [] call uo_fnc_endByBluKilled_preEliminated;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

        if (missionNamespace getVariable ["uo_bluDownSince", 0] > 15 || {uo_missionParam_DEFENSETIME - (serverTime - uo_init_gameStartTime) < WAVERESPAWNTIMELEFTBLU}) then {

            if (missionNamespace getVariable ["uo_endInProgressServer", false]) exitWith {INFO("A different ending is already in progress.")};
            uo_endInProgressServer = true;

            uo_missionStats = [uo_teammembersOpfor,uo_teammembersBlufor,["OPFOR"],["BLUFOR"]] call grad_winrateTracker_fnc_saveWinrate;
            publicVariable "uo_missionStats";

            missionNamespace setVariable ["uo_gameEnded", ["EAST", "BLUFOR ELIMINATED!"], true];
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    } , 1, []] call CBA_fnc_addPerFrameHandler;
};

[] call uo_fnc_endByBluKilled_preEliminated;
