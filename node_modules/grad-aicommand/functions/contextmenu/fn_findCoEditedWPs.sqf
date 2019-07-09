/*  Finds other waypoints that are right on top of each other
*
*/

#include "script_component.hpp"

params ["_waypoint"];

private _coEditedWaypoints = [];
private _searchWaypointPos = waypointPosition _waypoint;

{
    private _thisGroup = _x;
    private _waypoints = waypoints _thisGroup;
    private _activeWaypoints = _waypoints select [currentWaypoint _thisGroup,count _waypoints];

    {
        if (((waypointPosition _x) distance2D _searchWaypointPos) < 1) then {
            _coEditedWaypoints pushBack _x;
        };
    } forEach _activeWaypoints;
} forEach GVAR(currentGroups);

_coEditedWaypoints
