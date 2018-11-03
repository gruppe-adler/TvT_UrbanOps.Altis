#include "script_component.hpp"

params [["_units",[]]];

_units = _units select {local _x};
[_units] call ace_ai_fnc_unGarrison;

{
    if (((group _x) getVariable [QGVAR(isPaused),false]) || ((group _x) getVariable [QGVAR(isDirectEdit),false])) then {
        _x disableAI "PATH";
    };
} forEach _units;
