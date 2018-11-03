#include "script_component.hpp"

[{
    params ["_args","_handle"];

    if !(missionNamespace getVariable [QGVAR(commandwindow_isOpen),false]) exitWith {
        missionNamespace setVariable [QGVAR(editableGroups),nil];
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    GVAR(editableGroups) = allGroups select {[_x] call FUNC(isEditableGroup)};

},1,[]] call CBA_fnc_addPerFrameHandler;
