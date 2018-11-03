#include "script_component.hpp"

params ["_timeout"];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (isNull _currentGroup) exitWith {};

private _currentWaypoint = _currentGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

[_currentWaypoint,[_timeout,_timeout,_timeout]] remoteExecCall ["setWaypointTimeout",2,false];
