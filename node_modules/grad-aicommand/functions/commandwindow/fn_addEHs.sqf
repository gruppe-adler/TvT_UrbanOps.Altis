#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"

params ["_display","_mapCtrl"];

GVAR(leftButtonDown) = false;

GVAR(keyUpEH) = _display displayAddEventHandler ["KeyUp", {
    params ["_display","_DIK","_shift","_ctrl","_alt"];

    // don't do anything while user is typing new group name
    if (missionNamespace getVariable [QGVAR(renameDialogIsOpen),false]) exitWith {};

    // close on M
    if (_DIK in (actionKeys "HideMap")) exitWith {
        closeDialog 0;
    };

    // ctrl + A, select all groups
    if (_DIK == 30 && _ctrl) exitWith {
        GVAR(currentGroups) = +GVAR(editableGroups);
    };

    // DEL key
    if (_DIK == 211) exitWith {
        _this call FUNC(onDelKeyUp);
    };

    // H key, open help
    if (_DIK == 35) exitWith {
        _this call FUNC(toggleHelp);
    };
}];

GVAR(mouseDownEH) = _mapCtrl ctrlAddEventHandler ["MouseButtonDown", {
    params ["_control","_button","_xPos","_yPos"];

    // only leftclick
    if (_button > 0) exitWith {};

    GVAR(leftButtonDown) = true;
    GVAR(leftButtonDownTime) = diag_tickTime;
    GVAR(leftButtonDownPosScreen) = [_xPos,_yPos];
    GVAR(leftButtonDownPosWorld) = _control ctrlMapScreenToWorld [_xPos,_yPos];

    // keep help control visible
    _display = ctrlParent _control;
    _ctrlHelp = _display displayCtrl GRAD_AICOMMAND_HELP_CG;
    ctrlSetFocus _ctrlHelp;

    false
}];

GVAR(mouseUpEH) = _mapCtrl ctrlAddEventHandler ["MouseButtonUp", {
    params ["_control","_button"];

    // only leftclick
    if (_button > 0) exitWith {};

    GVAR(leftButtonDown) = false;

    false
}];


GVAR(mouseClickEH) = _mapCtrl ctrlAddEventHandler ["MouseButtonClick", {
    params ["_control","_button"];

    // currently nothing but left- and rightclick
    if (_button > 1) exitWith {};

    if (GVAR(leftButtonDown) && {_button == 0}) then {
        _this call FUNC(onLeftHeldDown);
    } else {
        _this call ([FUNC(onLeftClick),FUNC(onRightClick)] select _button);
    };


    false
}];
