#define PREFIX uo
#define COMPONENT civs
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};

uo_fnc_checkOpfKilled_preEliminated = {
    [{
        if (({side _x == east} count playableUnits) == 0 && (uo_DEALERKILLED || !uo_missionParam_OPFORRESPAWNENABLED) && BLUFORINCONTROL) then {
            [] call uo_fnc_checkOpfKilled_eliminated;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    } , 10, []] call CBA_fnc_addPerFrameHandler;
};


uo_fnc_checkOpfKilled_eliminated = {
    [{
        if (({side _x == east} count playableUnits) == 0 && (uo_DEALERKILLED || !uo_missionParam_OPFORRESPAWNENABLED) && BLUFORINCONTROL) then {
            _downSince = missionNamespace getVariable ["uo_opfDownSince", 0];
            missionNamespace setVariable ["uo_opfDownSince", _downSince + 1];
        } else {
            missionNamespace setVariable ["uo_opfDownSince", 0];
            [] call uo_fnc_checkOpfKilled_preEliminated;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

        if (missionNamespace getVariable ["uo_opfDownSince", 0] > 15) then {
            if (missionNamespace getVariable ["uo_endInProgressServer", false]) exitWith {INFO("A different ending is already in progress.")};
            uo_endInProgressServer = true;

            uo_missionStats = [uo_teammembersBlufor,uo_teammembersOpfor,["BLUFOR"],["OPFOR"]] call grad_winrateTracker_fnc_saveWinrate;
            publicVariable "uo_missionStats";

            missionNamespace setVariable ["uo_gameEnded", ["WEST", "OPFOR ELIMINATED!"], true];
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    } , 1, []] call CBA_fnc_addPerFrameHandler;
};

[] call uo_fnc_checkOpfKilled_preEliminated;
