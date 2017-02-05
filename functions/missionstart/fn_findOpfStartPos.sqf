if (!isServer) exitWith {};

{
	_nearRoads = ([getPos uo_DEALER, [0,25]] call uo_common_fnc_findRandomPos) nearRoads 25;
	if (side _x == EAST) then {
		_startPos = if (count _nearRoads > 0) then {([_nearRoads select 0,[0,10]] call uo_common_fnc_findRandomPos)} else {[getPos uo_DEALER, [10,30]] call uo_common_fnc_findRandomPos};
		_x setVariable ["startPosition", _startPos, true];
	};
} forEach playableUnits;

missionNamespace setVariable ["uo_init_opforSpawnSet", true, true];
