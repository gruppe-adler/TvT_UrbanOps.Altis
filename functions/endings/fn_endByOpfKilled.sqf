if (!isServer) exitWith {};

uo_fnc_endByOpfKilled_preEliminated = {
    [{
        if (({side _x == east} count playableUnits) == 0 && DEALERKILLED && BLUFORINCONTROL) then {
            [] call uo_fnc_endByOpfKilled_eliminated;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    } , 10, []] call CBA_fnc_addPerFrameHandler;
};


uo_fnc_endByOpfKilled_eliminated = {
    [{
        if (({side _x == east} count playableUnits) == 0 && DEALERKILLED && BLUFORINCONTROL) then {
            _downSince = missionNamespace getVariable ["uo_opfDownSince", 0];
            missionNamespace setVariable ["uo_opfDownSince", _downSince + 1];
        } else {
            missionNamespace setVariable ["uo_opfDownSince", 0];
            [] call uo_fnc_endByOpfKilled_preEliminated;
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

        if (missionNamespace getVariable ["uo_opfDownSince", 0] > 15) then {
            missionNamespace setVariable ["uo_gameEnded", ["WEST", "OPFOR ELIMINATED!"], true];
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    } , 1, []] call CBA_fnc_addPerFrameHandler;
};

[] call uo_fnc_endByOpfKilled_preEliminated;
