if (!isServer) exitWith {};

diag_log "fn_findBluStartPos - Finding spawn positions for Blufor.";

{
	if (side _x == WEST) then {
		_startPos = [getPos COMMANDVEHICLE, [0,15]] call mcd_fnc_findRandomPos;
		_x setVariable ["startPosition", _startPos, true];
	};
} forEach playableUnits;

missionNamespace setVariable ["uo_init_bluforSpawnSet", true, true];

diag_log format ["fn_findBluStartPos - Positions found for %1 players.", {side _x == WEST} count playableUnits];
