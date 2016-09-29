private ["_pos"];

[false] call mcd_fnc_blockMap;
_originalSide = player getVariable ["originalSide", "UNKNOWN"];

//teleport to commandvehicle
if (_originalSide == "WEST") then {
  if (!isNil "COMMANDVEHICLE") then {
    _pos = (getPos COMMANDVEHICLE) findEmptyPosition [1, 30];
  };
  [player, _pos] call mcd_fnc_teleport;
};

//teleport to city
if (_originalSide == "EAST") then {
  _pos = [] call mcd_fnc_findOpfSpawnPos;
  [player, _pos] call mcd_fnc_teleport;
};

if (_originalSide == "UNKNOWN") then {
  ["onPlayerRespawn.sqf - ERROR: PLAYER %1 HAS UNKNOWN SIDE.", profileName] remoteExec ["mcd_fnc_serverLog", 2, false];
};

//check JIP player is spawning for the first time
if (serverTime - (player getVariable ["joinTime", 0]) < 30 && didJIP) exitWith {diag_log "onPlayerRespawn.sqf - Player is JIP, not executing fnc_removeRespawnedFromList."};

//notify server
[profileName, player getVariable ["originalSide", "UNKNOWN"]] remoteExec ["mcd_fnc_removeFromWave",2,false];
