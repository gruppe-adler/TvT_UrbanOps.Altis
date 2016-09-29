if (!isServer) exitWith {};

diag_log "fn_findOpfStartPos - Finding spawn positions for Opfor.";

//find positions for all sidemembers
{
	if (side _x == EAST) then {
		_startPos = [CITYPOSITION, [0,15]] call mcd_fnc_findRandomPos;
		_x setVariable ["startPosition", _startPos, true];
	};
} forEach playableUnits;

missionNamespace setVariable ["uo_init_opforSpawnSet", true, true];
