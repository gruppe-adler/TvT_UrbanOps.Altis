#include "script_component.hpp"

params [["_id",-1]];

if (isNil QGVAR(customGroupContext)) exitWith {};

// dont deleteAt here so IDs stay consistent
GVAR(customGroupContext) set [_id,nil]
