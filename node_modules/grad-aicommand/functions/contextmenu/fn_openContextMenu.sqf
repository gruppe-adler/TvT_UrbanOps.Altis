#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"

params ["_open",["_dialogPos",[0,0]],["_waypointOrGroup",grpNull]];

private _display = findDisplay GRAD_AICOMMAND_COMMANDWINDOW_DIALOG;
private _controlsGroup = _display displayCtrl GRAD_AICOMMAND_CONTEXTMENU_GROUP;
private _map = _display displayCtrl GRAD_AICOMMAND_COMMANDWINDOW_MAP;

if (_open) then {

    grad_aicommand_contextmenu_mousehandler = _display displayAddEventHandler ["MouseButtonDown",{_this call grad_aicommand_fnc_catchMouseClick}];
    _controlsGroup ctrlShow true;
    _map ctrlEnable false;
    [] call FUNC(hideContextMenuItems);

    if (_waypointOrGroup isEqualType grpNull) then {
        [_dialogPos,_waypointOrGroup] call FUNC(createGroupMenu);
    } else {
        [_dialogPos,_waypointOrGroup] call FUNC(createWaypointMenu);
    };

} else {
    _display displayRemoveEventHandler ["MouseButtonDown",missionNamespace getVariable ["grad_aicommand_contextmenu_mousehandler",-1]];
    _controlsGroup ctrlShow false;
    _map ctrlEnable true;
};
