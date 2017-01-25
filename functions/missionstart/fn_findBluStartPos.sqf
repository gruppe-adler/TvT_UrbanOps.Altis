if (!isServer) exitWith {};

{
	if (side _x == WEST) then {
		_startPos = [getPos (uo_cv_allCVs select 0), [5,25]] call uo_common_fnc_findRandomPos;
		_x setVariable ["startPosition", _startPos, true];
	};
} forEach playableUnits;

missionNamespace setVariable ["uo_init_bluforSpawnSet", true, true];
