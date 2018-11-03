#include "script_component.hpp"

params [["_combatMode",""]];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (isNull _currentGroup) exitWith {};

private _currentWaypoint = _currentGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) exitWith {};

if (_combatMode in ["NO CHANGE","GREEN","WHITE","YELLOW", "RED"]) then {
    [_currentWaypoint,_combatMode] remoteExecCall ["setWaypointCombatMode",2,false];
};
