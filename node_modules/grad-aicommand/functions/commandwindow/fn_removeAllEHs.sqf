#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"

GVAR(leftButtonDown) = nil;

private _display = findDisplay GRAD_AICOMMAND_COMMANDWINDOW_DIALOG;

_display displayRemoveEventHandler ["MouseButtonDown",GVAR(mouseDownEH)];
_display displayRemoveEventHandler ["MouseButtonUp",GVAR(mouseUpEH)];
_display displayRemoveEventHandler ["MouseButtonClick",GVAR(mouseClickEH)];

_display displayRemoveEventHandler ["KeyUp",GVAR(keyUpEH)];
