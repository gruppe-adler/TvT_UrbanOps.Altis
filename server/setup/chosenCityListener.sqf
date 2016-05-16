/*  Listens for chosen Opfor location
*
*   executed via init.sqf on server
*/

waitUntil {!isNil "CHOSENLOCATION"};
waitUntil {!isNil "CITYCHOSEN"};

//SETUP PLAY AREA ==============================================================
[] execVM "server\setup\playAreaSetup.sqf";

//TELEPORT OPFOR ===============================================================
[] execVM "server\setup\teleportOpfor.sqf";
