#include "script_component.hpp"

params [["_combatMode",""]];

private _waypointMenuGroup = missionNamespace getVariable [QGVAR(groupMenuGroup),grpNull];
if (isNull _waypointMenuGroup) exitWith {};

private _currentWaypoint = _waypointMenuGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

// check if user has edited a waypoint that is on top of other groups' waypoints
private _editedWaypoints = [_currentWaypoint] call FUNC(findCoEditedWPs);

if (_combatMode in ["NO CHANGE","GREEN","WHITE","YELLOW", "RED"]) then {
    {[_x,_combatMode] remoteExecCall ["setWaypointCombatMode",2,false]} forEach _editedWaypoints;
};
