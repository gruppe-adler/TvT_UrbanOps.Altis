#include "script_component.hpp"

params [["_mode","SINGLE"]];

private _waypointMenuGroup = missionNamespace getVariable [QGVAR(groupMenuGroup),grpNull];
if (isNull _waypointMenuGroup) exitWith {};

switch (_mode) do {
    case ("SINGLE"): {
        private _currentWaypoint = _waypointMenuGroup getVariable [QGVAR(selectedWaypoint),[]];
        if (count _currentWaypoint == 0) exitWith {};

        // check if user has edited a waypoint that is on top of other groups' waypoints
        private _editedWaypoints = [_currentWaypoint] call FUNC(findCoEditedWPs);

        {deleteWaypoint _x} forEach _editedWaypoints;
    };

    case ("ALL"): {
        while {(count waypoints _waypointMenuGroup) > 0} do {
            deleteWaypoint ((waypoints _waypointMenuGroup) select 0);
        };
    };
};
