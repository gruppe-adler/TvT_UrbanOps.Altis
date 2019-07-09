#include "script_component.hpp"

private _currentGroups = missionNamespace getVariable [QGVAR(currentGroups),[]];
{_x setVariable [QGVAR(selectedWaypoint),nil]} forEach _currentGroups;

if (GVAR(editMode) == 1) then {
    {
        _x setVariable [QGVAR(isDirectEdit),nil,true];
        if (!(_x getVariable [QGVAR(isPaused),false])) then {
            {[_x,"PATH"] remoteExec ["enableAI",_x,false]} forEach (units _x);
        };
    } forEach GVAR(editableGroups);
};

GVAR(currentGroups) = nil;
GVAR(submenuJoinableGroups) = nil;
GVAR(renameDialogIsOpen) = nil;
GVAR(editMode) = nil;
GVAR(leftButtonDown) = nil;
GVAR(leftButtonDownPosScreen) = nil;
GVAR(leftButtonDownPosWorld) = nil;
GVAR(selectDrawEH) = nil;
GVAR(leftButtonDownTime) = nil;
GVAR(groupMenuGroup) = nil;

[] call FUNC(removeAllEHs);
