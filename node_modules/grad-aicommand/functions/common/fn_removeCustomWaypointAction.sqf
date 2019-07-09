#include "script_component.hpp"

params [["_id",-1]];

if (isNil QGVAR(customWaypointActions)) exitWith {};

// dont deleteAt here so IDs stay consistent
GVAR(customWaypointActions) set [_id,nil]
