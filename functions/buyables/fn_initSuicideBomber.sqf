params ["_unit"];

if (!isServer) exitWith {};

_unit disableAI "SUPPRESSION";
_unit disableAI "COVER";
_unit setUnitPos "UP";
group _unit allowFleeing 0;

[{
    params ["_args","_handle"];
    _args params ["_unit"];

    _nearestEnemy = _unit findNearestEnemy _unit;
    if (!isNull _nearestEnemy) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        if (count units (group _unit) > 1) then {
            [_unit] joinSilent grpNull;
        } else {
            [group _unit] call CBA_fnc_clearWaypoints;
        };
        group _unit setSpeedMode "FULL";
        [_unit,_nearestEnemy] call uo_buyables_fnc_suicideBomberTarget;
    };
} , 1, [_unit]] call CBA_fnc_addPerFrameHandler;
