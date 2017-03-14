#define PREFIX uo
#define COMPONENT missionstart
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_side"];

if (isServer) then {
	INFO_1("Players of side %1 teleported.", _side);
};

if (hasInterface && {playerSide == _side}) then {
	private ["_pos"];
	[{_pos = player getVariable "startPosition"; !isNil "_pos"}, {
		[false] call uo_ui_fnc_twoLineHint;

		if !([player] call uo_common_fnc_isCommander) then {
			player say "taskSucceeded";
		};

		_pos = player getVariable "startPosition";
		INFO_1("Teleporting player to %1 for game start.", _pos);
		[{
			params ["_pos"];
			_onTP = {
				openMap [false, false];
				_markObject = if (playerSide == WEST) then {uo_cv_allCVs select 0} else {uo_DEALER};
				_markerDescription = if (playerSide == WEST) then {"Commandvehicle"} else {"Dealer"};
				[_markObject,_markerDescription,30] call uo_common_fnc_temp3dMarker;
			};
			[player,_pos,_onTP] call uo_common_fnc_teleport;
		}, [_pos], random 2] call CBA_fnc_waitAndExecute;
	}, []] call CBA_fnc_waitUntilAndExecute;
};
