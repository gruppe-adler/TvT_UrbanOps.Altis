if (!isServer) exitWith {};

{
	if (side _x == EAST) then {
		_startPos = [CITYPOSITION, [0,15]] call uo_common_fnc_findRandomPos;
		_x setVariable ["startPosition", _startPos, true];
	};
} forEach playableUnits;

missionNamespace setVariable ["uo_init_opforSpawnSet", true, true];
