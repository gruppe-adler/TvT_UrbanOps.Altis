waitUntil {!isNil "GAMESTARTED"};
waitUntil {GAMESTARTED};
waitUntil {!isNil "cityTrigger"};
waitUntil {!isNull cityTrigger};

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
