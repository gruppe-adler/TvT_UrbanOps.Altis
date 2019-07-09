#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"

#include "script_component.hpp"

params ["_unit","_player"];

if ((group _unit) getVariable [QGVAR(isDirectEdit),false]) exitWith {
    hint "Group is already being edited.";
};

createDialog QGVAR(commandwindow);
private _display = findDisplay GRAD_AICOMMAND_COMMANDWINDOW_DIALOG;
private _map = _display ctrlCreate ["RscMapControl",GRAD_AICOMMAND_COMMANDWINDOW_MAP];
private _contextmenu = _display ctrlCreate ["RscControlsGroupNoScrollbars",GRAD_AICOMMAND_CONTEXTMENU_GROUP];
[_display] call FUNC(createRenameGroupDialog);
[_display] call FUNC(createHelpDialog);

_map ctrlSetPosition [safeZoneX,safeZoneY,safeZoneW,safeZoneH];
_map ctrlCommit 0;
_contextmenu ctrlShow false;
_renameGroupMenu ctrlShow false;

GVAR(highcommandSide) = side _player;

if (isNil QGVAR(individualUnitsGroups)) then {GVAR(individualUnitsGroups) = []};
if (isNil QGVAR(helpOpen)) then {GVAR(helpOpen) = false};

// highcommand mode
if (_unit == _player) then {
    GVAR(editMode) = 0;
    GVAR(currentGroups) = [];
    GVAR(editableGroups) = [];
    [] call FUNC(updateEditableGroups);

// direct edit mode
} else {
    GVAR(editMode) = 1;
    GVAR(currentGroups) = [group _unit];
    GVAR(editableGroups) = [group _unit];

    (group _unit) setVariable [QGVAR(isDirectEdit),true,true];
    {[_x,"PATH"] remoteExec ["disableAI",_x,false]} forEach (units (group _unit));

    GVAR(currentGroups) call GVAR(onGroupSelected);
};

_map ctrlAddEventHandler ["Draw",{_this call FUNC(drawEditableGroups)}];
_map ctrlAddEventHandler ["Draw",{_this call FUNC(drawIndividualUnits)}];
_map ctrlAddEventHandler ["Draw",{_this call FUNC(drawArrows)}];
[_display,_map] call FUNC(addEHs);

[_unit,_player,_display,_map] call GVAR(onMapOpenend);
