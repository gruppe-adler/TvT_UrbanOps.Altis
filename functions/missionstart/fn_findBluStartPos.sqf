if (!isServer) exitWith {};

{
	if (side _x == WEST) then {
		_startPos = [getPos (uo_cv_allCVs select 0), [3,15]] call uo_fnc_findRandomPos;
		_x setVariable ["startPosition", _startPos, true];
	};
} forEach playableUnits;

missionNamespace setVariable ["uo_init_bluforSpawnSet", true, true];

diag_log format ["fn_findBluStartPos - Positions found for %1 players.", {side _x == WEST} count playableUnits];
