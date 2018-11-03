#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"


params ["_mapCtrl","_button","_x","_y","_shift","_alt","_ctrl"];

private _mousePosWorld = _mapCtrl ctrlMapScreenToWorld [_x,_y];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (isNull _currentGroup) exitWith {};

private _nearestWaypoint = [_mousePosWorld, _currentGroup] call FUNC(findNearestWP);
private _nearestGroup = [_mousePosWorld] call FUNC(findNearestEditableGroup);


// null waypoint is empty array
if (count _nearestWaypoint == 0 && isNull _nearestGroup) exitWith {};

private _fnc_wp = {
    _wpWorldPos = waypointPosition _nearestWaypoint;
    _wpScreenPos = _mapCtrl ctrlMapWorldToScreen _wpWorldPos;

    _clickDistance = _wpScreenPos distance [_x,_y];
    if (_clickDistance < 0.02) then {
        _currentGroup setVariable [QGVAR(selectedWaypoint),_nearestWaypoint];
        [true,_wpScreenPos,_nearestWaypoint] call FUNC(openContextMenu);
    };
};

private _fnc_grp = {
    _grpWorldPos = getPos leader _nearestGroup;
    _grpScreenPos = _mapCtrl ctrlMapWorldToScreen _grpWorldPos;

    _clickDistance = _grpScreenPos distance [_x,_y];
    if (_clickDistance < 0.02) then {
        GVAR(currentGroup) = _nearestGroup;
        [true,_grpScreenPos,_nearestGroup] call FUNC(openContextMenu);
    };
};


if (count _nearestWaypoint > 0 && !isNull _nearestGroup) then {
    _wpWorldPos = waypointPosition _nearestWaypoint;
    _grpWorldPos = getPos leader _nearestGroup;
    if (_wpWorldPos distance2D _mousePosWorld < _grpWorldPos distance2D _mousePosWorld) then _fnc_wp else _fnc_grp;

} else {
    if (count _nearestWaypoint > 0) then _fnc_wp else _fnc_grp;
};
