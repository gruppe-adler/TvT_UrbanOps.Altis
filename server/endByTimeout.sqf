/*  Ends the game after Opfor has held the city for CAPTURETIME
*
*   executed via init.sqf on server
*/

waitUntil {!isNil "BLUFORTELEPORTED"};
waitUntil {BLUFORTELEPORTED};

diag_log format ["endByTimeout.sqf - Opfor has to defend the city for %1s.", CAPTURETIME];
sleep CAPTURETIME;

diag_log "endByTimeout.sqf - Opfor has defended the city.";

publicVariable "GAMEENDED";
publicVariable "CITYDEFENDED";
