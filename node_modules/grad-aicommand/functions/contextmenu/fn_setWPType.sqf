#include "script_component.hpp"

params ["_type"];

private _waypointMenuGroup = missionNamespace getVariable [QGVAR(groupMenuGroup),grpNull];
if (isNull _waypointMenuGroup) exitWith {};

private _currentWaypoint = _waypointMenuGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

// check if user has edited a waypoint that is on top of other groups' waypoints
private _editedWaypoints = [_currentWaypoint] call FUNC(findCoEditedWPs);

if (_type in ["MOVE","CYCLE","GETIN NEAREST","GETOUT"]) then {
    {[_x,_type] remoteExecCall ["setWaypointType",2,false]} forEach _editedWaypoints;
};
