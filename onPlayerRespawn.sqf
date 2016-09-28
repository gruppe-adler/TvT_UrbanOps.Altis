//teleport to commandvehicle
if (originalSide == "WEST") then {
  _pos = (getPos COMMANDVEHICLE) findEmptyPosition [1, 30];
  [player, _pos] call mcd_fnc_teleport;
};

//teleport to city
if (originalSide == "EAST") then {
  _pos = [] call mcd_fnc_findOpfSpawnPos;
  [player, _pos] call mcd_fnc_teleport;
};

//check JIP player is spawning for the first time
if (serverTime - (player getVariable ["joinTime", 0]) < 30 && didJIP) exitWith {diag_log "onPlayerRespawn.sqf - Player is JIP, not executing fnc_removeRespawnedFromList."};

//notify server
[profileName, player getVariable ["originalSide", "UNKNOWN"]] remoteExec ["mcd_fnc_removeFromWave",2,false];
