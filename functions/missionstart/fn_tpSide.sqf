#define PREFIX uo
#define COMPONENT missionstart
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_side"];

if (isServer) then {
	if (_side == WEST) then {
		missionNamespace setVariable ["uo_init_gameStartTime", serverTime, true];
		missionNamespace setVariable ["uo_init_gamestarted", true, true];
	};
	INFO_1("Players of side %1 teleported.", _side);
};

if (!hasInterface) exitWith {};
if (side player != _side) exitWith {};

private ["_pos"];
[{_pos = player getVariable "startPosition"; !isNil "_pos"}, {
	[false] call uo_ui_fnc_twoLineHint;

	if !([player] call uo_common_fnc_isCommander) then {
		player say "taskSucceeded";
	};

	_pos = player getVariable "startPosition";
	INFO_1("Teleporting player to %1 for game start.", _pos);
	player allowDamage false;
	player setPos _pos;
	[{
		player allowDamage true;
		openMap [false, false];
	}, [], 2] call CBA_fnc_waitAndExecute;
}, []] call CBA_fnc_waitUntilAndExecute;
