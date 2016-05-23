/*  Provides synced countdown time value for players
*
*   executed via init.sqf on server
*/

waitUntil {!isNil "SETUPTIME"};
SETUPTIMEREMAINING = SETUPTIME;
publicVariable "SETUPTIMEREMAINING";
waitUntil {sleep 0.5; !isNil "CITYPOSITION"};

diag_log "setupCountdown.sqf starting...";
while {SETUPTIMEREMAINING > 0} do {
  sleep 1;
  SETUPTIMEREMAINING = SETUPTIMEREMAINING - 1;
  publicVariable "SETUPTIMEREMAINING";
};
