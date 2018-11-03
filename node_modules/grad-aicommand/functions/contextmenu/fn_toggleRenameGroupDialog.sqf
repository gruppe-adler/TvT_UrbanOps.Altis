#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"

params [["_open",false]];

diag_log ["fn_toggleRenameGroupDialog",_this];

private _display = findDisplay GRAD_AICOMMAND_COMMANDWINDOW_DIALOG;
private _controlsGroup = _display displayCtrl GRAD_AICOMMAND_RENAMEGROUP_GROUP;

if (isNull _controlsGroup) exitWith {ERROR("Rename group dialog controlsgroup is null.")};

if (_open) then {
    _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
    if (isNull _currentGroup) exitWith {};

    _titlebar = _controlsGroup controlsGroupCtrl GRAD_AICOMMAND_RENAMEGROUP_TITLE;
    _titlebar ctrlSetText format ["RENAME %1",toUpper groupID _currentGroup];

    _map = _display displayCtrl GRAD_AICOMMAND_COMMANDWINDOW_MAP;

    _controlsGroup ctrlShow true;
    _map ctrlShow false;
    _map ctrlShow true;

    GVAR(renameDialogIsOpen) = true;
} else {

    _controlsGroup ctrlShow false;
    GVAR(renameDialogIsOpen) = false;
};
