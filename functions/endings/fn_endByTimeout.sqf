if (!isServer) exitWith {};

diag_log format ["fn_endByTimeout - Starting... Opfor has to defend the city for %1s.", uo_missionParam_DEFENSETIME];

[{
    missionNamespace setVariable ["uo_gameEnded", ["EAST","CITY DEFENDED!"], true];
    diag_log "fn_endByTimeout - Opfor has defended the city.";
}, [], uo_missionParam_DEFENSETIME] call CBA_fnc_waitAndExecute;
