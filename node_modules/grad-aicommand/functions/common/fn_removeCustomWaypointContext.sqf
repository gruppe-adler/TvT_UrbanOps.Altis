#include "script_component.hpp"

params [["_id",-1]];

if (isNil QGVAR(customWaypointContext)) exitWith {};

// dont deleteAt here so IDs stay consistent
GVAR(customWaypointContext) set [_id,nil]
