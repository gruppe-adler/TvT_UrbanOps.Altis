#include "script_component.hpp"

params [["_displayName",""],["_statement",""]];

if (isNil QGVAR(customWaypointContext)) then {
    GVAR(customWaypointContext) = [];
};

GVAR(customWaypointContext) pushBack _this
