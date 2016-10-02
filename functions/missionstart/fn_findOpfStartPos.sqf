if (!isServer) exitWith {};

diag_log "fn_findOpfStartPos - Finding spawn positions for Opfor.";

{
	if (side _x == EAST) then {
		_startPos = [CITYPOSITION, [0,15]] call mcd_fnc_findRandomPos;
		_x setVariable ["startPosition", _startPos, true];
	};
} forEach playableUnits;

missionNamespace setVariable ["uo_init_opforSpawnSet", true, true];

diag_log format ["fn_findOpfStartPos - Positions found for %1 players.", {side _x == EAST} count playableUnits];
