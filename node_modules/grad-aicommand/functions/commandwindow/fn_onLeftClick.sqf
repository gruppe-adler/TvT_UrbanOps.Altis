#include "script_component.hpp"

params ["_mapCtrl","_button","_x","_y","_shift","_alt","_ctrl"];

if (missionNamespace getVariable [QGVAR(contextmenu_isOpen),false]) exitWith {};
if (missionNamespace getVariable [QGVAR(isDeleteClick),false]) exitWith {};

private _mousePosWorld = _mapCtrl ctrlMapScreenToWorld [_x,_y];

private _nearestGroup = [_mousePosWorld] call FUNC(findNearestEditableGroup);
private _grpWorldPos = getPos leader _nearestGroup;
private _grpScreenPos = _mapCtrl ctrlMapWorldToScreen _grpWorldPos;
private _clickDistance = _grpScreenPos distance [_x,_y];

private _previousGroups = missionNamespace getVariable [QGVAR(currentGroups),[]];

// click on group
if (_clickDistance < 0.04 && {!isNull _nearestGroup}) then {

    if !(_nearestGroup in GVAR(currentGroups)) then {
        GVAR(currentGroups) = [_nearestGroup];
        GVAR(currentGroups) call GVAR(onGroupSelected);

        if (count _previousGroups > 0) then {
            _previousGroups call GVAR(onGroupUnselected);
        };
    };

// click on map
} else {
    GVAR(currentGroups) = [];

    if (count _previousGroups > 0) then {
        _previousGroups call GVAR(onGroupUnselected);
    };
};
