/*	Finds spawn position for Blufor and teleports them.
*
*		executed via server\setup\chosenSpawnListener.sqf on server
*/

waitUntil {!isNil "BLUFORSPAWN"};
waitUntil {!isNil "COMMANDVEHICLECLASS"};

_hndl = [] execVM "server\setup\createCommandVehicle.sqf";
waitUntil {scriptDone _hndl};

//find positions for all sidemembers
diag_log "teleportBlufor.sqf - Finding spawn positions for Blufor.";
{
	if (side _x == WEST) then {
		_spawnPos = [BLUFORSPAWN, [0,15], [0,360], 0] call SHK_pos;
		_x setVariable ["spawnPosition", _spawnPos, true];
		sleep 0.2;
	};
} forEach playableUnits;

sleep 2;

//Make players teleport themselves
diag_log "teleportBlufor.sqf - Remote executing teleport for Blufor.";
[[], "player\setup\tpBlufor.sqf"] remoteExec ["execVM",0,false];

BLUFORTELEPORTED = true;
publicVariable "BLUFORTELEPORTED";
