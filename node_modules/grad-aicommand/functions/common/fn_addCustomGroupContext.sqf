#include "script_component.hpp"

params [["_displayName",""],["_statement",""]];

if (isNil QGVAR(customGroupContext)) then {
    GVAR(customGroupContext) = [];
};

GVAR(customGroupContext) pushBack _this
