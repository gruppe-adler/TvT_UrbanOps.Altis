/*	Finds spawn position for Opfor and teleports them.
*
*		executed via server\setup\chosenCityListener.sqf on server
*/

waitUntil {!isNil "CITYPOSITION"};
diag_log "teleportOpfor.sqf - Finding spawn positions for Opfor.";

//find positions for all sidemembers
{
	if (side _x == EAST) then {
		_spawnPos = [CITYPOSITION, [0,15], [0,360], 0] call SHK_pos;
		_x setVariable ["spawnPosition", _spawnPos, true];
		sleep 0.2;
	};
} forEach playableUnits;

sleep 2;

//Make players teleport themselves
diag_log "teleportOpfor.sqf - Remote executing teleport for Opfor.";
[[], "player\setup\tpOpfor.sqf"] remoteExec ["execVM",0,false];

OPFORTELEPORTED = true;
publicVariable "OPFORTELEPORTED";
