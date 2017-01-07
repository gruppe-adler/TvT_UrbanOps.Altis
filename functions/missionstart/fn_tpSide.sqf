params ["_side"];

if (isServer) then {
	if (_side == WEST) then {
		missionNamespace setVariable ["uo_init_gamestarted", true, true];
	};

	diag_log format ["fn_tpSide - Players of side %1 teleported.", _side];
};

if (!hasInterface) exitWith {};
if (side player != _side) exitWith {};

player say "taskSucceeded";

private ["_pos"];
[{_pos = player getVariable "startPosition"; !isNil "_pos"}, {
	[false] call uo_ui_fnc_twoLineHint;

	_pos = player getVariable "startPosition";
	diag_log format ["fn_tpOpfor - Teleporting player to %1.", _pos];
	player allowDamage false;
	player setPos _pos;
	[{
		player allowDamage true;
		openMap [false, false];
	}, [], 2] call CBA_fnc_waitAndExecute;
}, []] call CBA_fnc_waitUntilAndExecute;
