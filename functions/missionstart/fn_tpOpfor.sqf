if (!hasInterface) exitWith {};
if (side player != EAST) exitWith {};

private ["_pos"];
[{_pos = player getVariable "startPosition"; !isNil "_pos"}, {
	titleRsc ["Default", "PLAIN"];

	_pos = player getVariable "startPosition";
	diag_log format ["fn_tpOpfor - Teleporting player to %1.", _pos];
	player allowDamage false;
	player setPos _pos;
	[{
		player allowDamage true;
		openMap [false, false];
	}, [], 2] call CBA_fnc_waitAndExecute;
}, []] call CBA_fnc_waitUntilAndExecute;
