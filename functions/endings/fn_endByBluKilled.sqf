if (!isServer) exitWith {};

mcd_fnc_endByBluKilled_preEliminated = {
    [{
        if (({side _x == west} count playableUnits) == 0) then {
            diag_log "fn_endByBluKilled - All Blufor down.";
            if ({_x getVariable ["uo_respawnObject_isActive", false]} count uo_cv_allCVs == 0) then {
                diag_log "fn_endByBluKilled - All commandvehicles inactive";
                [] call mcd_fnc_endByBluKilled_eliminated;
                [_this select 1] call CBA_fnc_removePerFrameHandler;
            };
        };
    } , 5, []] call CBA_fnc_addPerFrameHandler;
};

mcd_fnc_endByBluKilled_eliminated = {
    [{
        if (({side _x == west} count playableUnits) == 0) then {
            _downSince = missionNamespace getVariable ["uo_bluDownSince", 0];
            missionNamespace setVariable ["uo_bluDownSince", _downSince + 1];
        } else {
            missionNamespace setVariable ["uo_bluDownSince", 0];
            [] call mcd_fnc_endByBluKilled_preEliminated;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

        if (missionNamespace getVariable ["uo_bluDownSince", 0] > 15) then {
            missionNamespace setVariable ["uo_gameEnded", ["EAST", "BLUFOR ELIMINATED!"], true];
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    } , 1, []] call CBA_fnc_addPerFrameHandler;
};

[] call mcd_fnc_endByBluKilled_preEliminated;
