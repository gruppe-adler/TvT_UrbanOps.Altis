waitUntil {!isNil "originalSide"};
waitUntil {!isNull player};

player allowDamage false;

//get loadout
[] execVM "loadouts\loadoutInit.sqf";

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
if (serverTime-joinTime < 30 && didJIP) exitWith {diag_log "onPlayerRespawn.sqf - Player is JIP, not executing fnc_removeRespawnedFromList."};

//notify server
[profileName, originalSide] remoteExec ["mcd_fnc_removeRespawnedFromList",2,false];
