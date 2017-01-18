if (!isServer) exitWith {};

{
	if (side _x == EAST) then {
		_startPos = [getPos uo_DEALER, [0,50]] call uo_common_fnc_findRandomPos;
		_x setVariable ["startPosition", _startPos, true];
	};
} forEach playableUnits;

missionNamespace setVariable ["uo_init_opforSpawnSet", true, true];
