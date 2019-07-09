#include "script_component.hpp"

params ["_condition","_statement","_statementName"];

private _waypointMenuGroup = missionNamespace getVariable [QGVAR(groupMenuGroup),grpNull];
if (isNull _waypointMenuGroup) exitWith {};

private _currentWaypoint = _waypointMenuGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

// check if user has edited a waypoint that is on top of other groups' waypoints
private _editedWaypoints = [_currentWaypoint] call FUNC(findCoEditedWPs);

{
    _x setWaypointStatements [_condition,_statement];
    _x setWaypointDescription _statementName;    
} forEach _editedWaypoints;
