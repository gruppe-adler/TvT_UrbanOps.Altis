#include "script_component.hpp"

params ["_map"];

{
    {
        _map drawIcon [
            "iconman",
            [side _x] call FUNC(getSideColor),
            getPos _x,
            24,
            24,
            getDir _x,
            "",
            0,
            0.04,
            'TahomaB',
            'right'
        ];
    } forEach units _x;
} forEach (GVAR(individualUnitsGroups) arrayIntersect GVAR(editableGroups));
