/*  Listens for chosen Blufor spawn
*
*   executed via init.sqf on server
*/

waitUntil {!isNil "BLUFORSPAWN"};
waitUntil {!isNil "SPAWNCHOSEN"};

//TELEPORT BLUFOR ==============================================================
[] execVM "server\setup\teleportBlufor.sqf";

//CREATE CITY TRIGGER ==========================================================
[] execVM "server\setup\createTriggers.sqf";

//GAME HAS STARTED =============================================================
GAMESTARTED = true;
publicVariable "GAMESTARTED";
