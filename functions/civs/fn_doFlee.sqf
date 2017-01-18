params ["_unit"];

_unit enableAI "PATH";

[group _unit] call CBA_fnc_clearWaypoints;

_randomPos = _unit getRelPos [50 + random 150, random 360];
_targetPos = [_randomPos] call uo_civs_fnc_findPositionOfInterest;

_unit setSpeedMode "FULL";

_waypoint = (group _unit) addWaypoint [_targetPos, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointSpeed "FULL";
