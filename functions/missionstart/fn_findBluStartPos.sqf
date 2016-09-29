if (!isServer) exitWith {};

diag_log "fn_findBluStartPos - Finding spawn positions for Blufor.";

{
	if (side _x == WEST) then {
		_startPos = [getPos COMMANDVEHICLE, [0,15]] call mcd_fnc_findRandomPos;
		_x setVariable ["startPosition", _startPos, true];
	};
} forEach playableUnits;

missionNamespace setVariable ["uo_init_bluforSpawnSet", true, true];
