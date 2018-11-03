#include "script_component.hpp"

params ["_condition","_statement","_statementName"];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (isNull _currentGroup) exitWith {};

private _currentWaypoint = _currentGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

_currentWaypoint setWaypointStatements [_condition,_statement];
_currentWaypoint setWaypointDescription _statementName;
