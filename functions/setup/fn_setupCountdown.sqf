if (!isServer) exitWith {};

SETUPTIMEREMAINING = SETUPTIME;
publicVariable "SETUPTIMEREMAINING";

[{!isNil "CITYPOSITION"}, {
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
