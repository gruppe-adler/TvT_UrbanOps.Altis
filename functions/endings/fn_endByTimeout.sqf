if (!isServer) exitWith {};

diag_log format ["fn_endByTimeout - Starting... Opfor has to defend the city for %1s.", DEFENSETIME];

[{
  missionNamespace setVariable ["uo_gameEnded", true, true];
  missionNamespace setVariable ["uo_cityDefended", true, true];
  diag_log "fn_endByTimeout - Opfor has defended the city.";
}, [], DEFENSETIME] call CBA_fnc_waitAndExecute;
