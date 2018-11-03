#include "script_component.hpp"

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
_currentGroup setVariable [QGVAR(selectedWaypoint),nil];

if (GVAR(editMode) == 1) then {
    {
        _x setVariable [QGVAR(isDirectEdit),nil,true];
        if (!(_x getVariable [QGVAR(isPaused),false])) then {
            {[_x,"PATH"] remoteExec ["enableAI",_x,false]} forEach (units _x);
        };
    } forEach GVAR(editableGroups);
};

GVAR(currentGroup) = nil;
GVAR(submenuJoinableGroups) = nil;
GVAR(renameDialogIsOpen) = nil;
GVAR(editMode) = nil;

[] call FUNC(removeAllEHs);
