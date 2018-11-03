#include "script_component.hpp"

params ["_pos","_group"];

private _nearestWaypoint = [];

private _minDist = 9999999999;
private _activeWPs = waypoints _group select {
    (_x select 1) >= currentWaypoint _group
};

{
    _distance = (waypointPosition _x) distance2D _pos;
    if (_distance < _minDist) then {
        _minDist = _distance;
        _nearestWaypoint = _x;
    };
} forEach _activeWPs;

_nearestWaypoint
