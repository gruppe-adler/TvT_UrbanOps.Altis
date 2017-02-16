params ["_pos","_waypoints",["_maxDistance",100],["_excludedIDs",[-1]]];

_nearestWaypointID = -1;
_distance = _maxDistance;
{
    _wpPos = _x select 0;
    _distanceWP = _pos distance2D _wpPos;
    if (_distanceWP < _distance && !(_forEachIndex in _excludedIDs)) then {
        _nearestWaypointID = _forEachIndex;
        _distance = _distanceWP;
    };

} forEach _waypoints;

_nearestWaypointID
