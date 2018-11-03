#include "script_component.hpp"

params ["_speed"];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (isNull _currentGroup) exitWith {};

private _currentWaypoint = _currentGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

if (_speed in ["UNCHANGED","LIMITED","NORMAL","FULL"]) then {
    [_currentWaypoint,_speed] remoteExecCall ["setWaypointSpeed",2,false];
};
