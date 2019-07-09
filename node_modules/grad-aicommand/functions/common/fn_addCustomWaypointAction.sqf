#include "script_component.hpp"

params [["_displayName",""],["_statement",""]];

if (isNil QGVAR(customWaypointActions)) then {
    GVAR(customWaypointActions) = [];
};

GVAR(customWaypointActions) pushBack _this
