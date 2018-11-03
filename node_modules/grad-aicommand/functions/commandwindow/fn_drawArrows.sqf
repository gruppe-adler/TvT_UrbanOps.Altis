#include "script_component.hpp"

params ["_map"];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),objNull];
if (isNull _currentGroup) exitWith {};

private _waypoints = waypoints _currentGroup;
private _color = [side _currentGroup] call FUNC(getSideColor);

private _currentWaypointID = currentWaypoint _currentGroup;

for [{_i = _currentWaypointID}, {_i<count _waypoints}, {_i=_i+1}] do {
    _lastWP = _waypoints param [_i-1,[]];
    _thisWP = _waypoints select _i;

    _lastWPPos = if (_i == _currentWaypointID || count _lastWP == 0) then {getPos leader _currentGroup} else {waypointPosition _lastWP};
    _thisWPPos = waypointPosition _thisWP;

    _map drawArrow [_lastWPPos,_thisWPPos,_color];
};
