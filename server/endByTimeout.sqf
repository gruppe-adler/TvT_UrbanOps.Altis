/*  Ends the game after Opfor has held the city for DEFENSETIME
*
*   executed via init.sqf on server
*/

waitUntil {!isNil "GAMESTARTED"};
waitUntil {GAMESTARTED};

diag_log "endByTimeout.sqf starting...";
diag_log format ["endByTimeout.sqf - Opfor has to defend the city for %1s.", DEFENSETIME];

sleep DEFENSETIME;
GAMEENDED = true;
CITYDEFENDED = true;
diag_log "endByTimeout.sqf - Opfor has defended the city.";

publicVariable "GAMEENDED";
publicVariable "CITYDEFENDED";
