waitUntil {!isNil "originalSide"};
waitUntil {!isNull player};

player allowDamage false;

//get loadout
[] execVM "loadouts\loadoutInit.sqf";

//teleport to spawn
if (originalSide == "WEST") then {
  _pos = (getPos COMMANDVEHICLE) findEmptyPosition [1, 30];
  player setPos _pos;
  sleep 1;
  player allowDamage true;
} else {
  _pos = CITYPOSITION findEmptyPosition [1,50];
  player setPos _pos;
  sleep 1;
  player allowDamage true;
};

//check JIP player is spawning for the first time
if (serverTime-joinTime < 30 && didJIP) exitWith {diag_log "onPlayerRespawn.sqf - Player is JIP, not executing mcd_fnc_removeRespawnedFromList."};

//notify server
[profileName, originalSide] remoteExec ["mcd_fnc_removeRespawnedFromList",2,false];
