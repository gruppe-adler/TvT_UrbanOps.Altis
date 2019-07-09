#include "script_component.hpp"

params ["_map"];

private _currentGroups = missionNamespace getVariable [QGVAR(currentGroups),[]];
if (count _currentGroups == 0) exitWith {};

{
    private _thisGroup = _x;
    private _waypoints = waypoints _thisGroup;
    private _color = [side _thisGroup] call FUNC(getSideColor);

    private _currentWaypointID = currentWaypoint _thisGroup;

    for [{_i = _currentWaypointID}, {_i<count _waypoints}, {_i=_i+1}] do {
        _lastWP = _waypoints param [_i-1,[]];
        _thisWP = _waypoints select _i;

        _lastWPPos = if (_i == _currentWaypointID || count _lastWP == 0) then {getPos leader _thisGroup} else {waypointPosition _lastWP};
        _thisWPPos = waypointPosition _thisWP;

        _map drawArrow [_lastWPPos,_thisWPPos,_color];
    };
} forEach _currentGroups;
