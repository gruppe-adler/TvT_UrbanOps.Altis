#include "script_component.hpp"

params [["_behaviour",""]];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (isNull _currentGroup) exitWith {};

private _currentWaypoint = _currentGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

if (_behaviour in ["UNCHANGED","CARELESS","SAFE","AWARE","COMBAT","STEALTH"]) then {
    [_currentWaypoint,_behaviour] remoteExecCall ["setWaypointBehaviour",2,false];
};
