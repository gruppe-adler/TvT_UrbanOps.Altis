#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"

params [["_display",displayNull]];

private _helpCg = _display displayCtrl GRAD_AICOMMAND_HELP_CG;
if (isNull _helpCg) exitWith {};

GVAR(helpOpen) = !GVAR(helpOpen);

private _height = [GRAD_AICOMMAND_HELP_H_COLLAPSED,GRAD_AICOMMAND_HELP_H_EXPANDED] select GVAR(helpOpen);

_helpCg ctrlSetPosition [GRAD_AICOMMAND_HELP_X,GRAD_AICOMMAND_HELP_Y,GRAD_AICOMMAND_HELP_W,_height];
_helpCg ctrlCommit 0.2;

playSound "addTime";
