if (!isServer) exitWith {};

SETUPTIMEREMAINING = uo_missionParam_SETUPTIME;
publicVariable "SETUPTIMEREMAINING";

[{!isNil "CITYPOSITION" && (missionNamespace getVariable ["uo_init_briefingDone", false])}, {
    diag_log "fn_setupCountdown starting...";
    _countdown = {
        SETUPTIMEREMAINING = SETUPTIMEREMAINING - 1;
        publicVariable "SETUPTIMEREMAINING";
        if (SETUPTIMEREMAINING <= 0) then {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    };
    [_countdown, 1, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
