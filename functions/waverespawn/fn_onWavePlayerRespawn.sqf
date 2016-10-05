private ["_pos"];

[false] call mcd_fnc_blockMap;
_originalSide = player getVariable ["originalSide", "UNKNOWN"];
if (count uo_cv_allCVs == 0) exitWith {diag_log "fn_onWavePlayerRespawn - ERROR: NO COMMAND VEHICLES."};

//teleport to commandvehicle
if (_originalSide == "WEST") then {
  _pos = (getPos (uo_cv_allCVs select 0)) findEmptyPosition [1, 30];
  [player, _pos] call mcd_fnc_teleport;
};

//teleport to city
if (_originalSide == "EAST") then {
  _pos = [] call mcd_fnc_findOpfSpawnPos;
  [player, _pos] call mcd_fnc_teleport;
};

if (_originalSide == "UNKNOWN") then {
  ["onPlayerRespawn.sqf - ERROR: PLAYER %1 HAS UNKNOWN SIDE.", profileName] call mcd_fnc_serverLog;
};

//check JIP player is spawning for the first time
if (serverTime - (player getVariable ["joinTime", 0]) < 30 && didJIP) exitWith {diag_log "onPlayerRespawn.sqf - Player is JIP, not executing fnc_removeRespawnedFromList."};

//notify server
[profileName, player getVariable ["originalSide", "UNKNOWN"]] remoteExec ["mcd_fnc_removeFromWave",2,false];
