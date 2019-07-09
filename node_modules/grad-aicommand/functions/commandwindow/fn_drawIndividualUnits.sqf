#include "script_component.hpp"

params ["_map"];

{
    private _leaderPos = getPos leader _x;
    private _sideColor = [side _x] call FUNC(getSideColor);

    {
        private _thisUnitPos = getPos _x;

        if (effectiveCommander vehicle _x == _x) then {
            _map drawIcon [
                [typeof vehicle _x] call ace_common_fnc_getVehicleIcon,
                _sideColor,
                _thisUnitPos,
                24,
                24,
                getDir _x,
                "",
                0,
                0.04,
                'TahomaB',
                'right'
            ];

            _map drawLine [
                _thisUnitPos,
                _leaderPos,
                [0.5,1,1,1]
            ];
        };
    } forEach units _x;
} forEach (GVAR(individualUnitsGroups) arrayIntersect GVAR(editableGroups));
