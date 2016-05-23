/*  Ends the game after Blufor has held the city for CAPTURETIME
*
*   executed via init.sqf on server
*/

waitUntil {!isNil "GAMESTARTED"};
waitUntil {GAMESTARTED};
waitUntil {!isNil "cityTrigger"};
waitUntil {!isNull cityTrigger};

diag_log "endByControl.sqf starting...";

while {!GAMEENDED} do {

  CAPTURETIMEREMAINING = CAPTURETIME;
  publicVariable "CAPTURETIMEREMAINING";
  waitUntil {sleep 5; BLUFORINCONTROL};

  diag_log "endByControl.sqf - Blufor has taken control of the city.";
  while {BLUFORINCONTROL} do {
    CAPTURETIMEREMAINING = CAPTURETIMEREMAINING - 1;
    publicVariable "CAPTURETIMEREMAINING";
    if (CAPTURETIMEREMAINING <= 0) exitWith {GAMEENDED = true; CITYCAPTURED = true;};
    sleep 1;
  };
  diag_log "endByControl.sqf - Blufor has won the game or lost control of the city.";
};

publicVariable "GAMEENDED";
publicVariable "CITYCAPTURED";
