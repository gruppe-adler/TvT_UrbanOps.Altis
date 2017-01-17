if (!isServer) exitWith {};

[{
    if (BLUFORINCONTROL) then {
        CAPTURETIMEREMAINING = CAPTURETIMEREMAINING - 1;
        publicVariable "CAPTURETIMEREMAINING";

        if (CAPTURETIMEREMAINING <= 0) then {
            uo_missionStats = [uo_teammembersBlufor,uo_teammembersOpfor,["BLUFOR"],["OPFOR"]] call grad_winrateTracker_fnc_saveWinrate;
            publicVariable "uo_missionStats";

            missionNamespace setVariable ["uo_gameEnded", ["WEST", "CITY CAPTURED!"], true];
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    };
} , 1, []] call CBA_fnc_addPerFrameHandler;
