/*  Spawns command vehicle for blufor
*
*   executed via server\setup\teleportBlufor.sqf on server
*/

//find pos
_pos = BLUFORSPAWN findEmptyPosition [0,150,COMMANDVEHICLECLASS];
if (str _pos == "[]") exitWith {diag_log "createCommandVehicle.sqf - ERROR: NO POSITION FOUND FOR COMMAND VEHICLE."};

//spawn vehicle
COMMANDVEHICLE = COMMANDVEHICLECLASS createVehicle _pos;
waitUntil {!isNull COMMANDVEHICLE};
publicVariable "COMMANDVEHICLE";
[COMMANDVEHICLE] call mcd_fnc_emptyContainer;

//add EH
COMMANDVEHICLE addEventHandler ["killed", {COMMANDVEHICLEDESTROYED = true; publicVariable "COMMANDVEHICLEDESTROYED"}];
