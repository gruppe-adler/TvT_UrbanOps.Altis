#include "script_component.hpp"

params ["_pos","_groups"];

private _nearestWaypoint = [];

private _minDist = 9999999999;

{
    private _thisGroup = _x;
    private _activeWPs = waypoints _thisGroup select {
        (_x select 1) >= currentWaypoint _thisGroup
    };

    {
        _distance = (waypointPosition _x) distance2D _pos;
        if (_distance < _minDist) then {
            _minDist = _distance;
            _nearestWaypoint = _x;
        };
    } forEach _activeWPs;

} forEach _groups;

_nearestWaypoint
