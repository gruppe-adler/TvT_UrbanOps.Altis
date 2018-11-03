#include "script_component.hpp"

params ["_pos"];

private _nearestGroup = grpNull;
private _minDist = 99999999999999;
{
    _distance = _pos distance2D (getPos leader _x);
    if (_distance < _minDist) then {
        _minDist = _distance;
        _nearestGroup = _x;
    };
} forEach GVAR(editableGroups);

_nearestGroup
