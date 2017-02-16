#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"

params ["_open",["_dialogPos",[0,0]],["_waypoint",[]]];

_display = findDisplay grad_aicommand_commandwindow_DIALOG;
_controlsGroup = _display displayCtrl grad_aicommand_contextmenu_GROUP;
_map = _display displayCtrl grad_aicommand_commandwindow_MAP;

if (_open) then {

    grad_aicommand_contextmenu_mousehandler = _display displayAddEventHandler ["MouseButtonDown",{_this call grad_aicommand_fnc_catchMouseClick}];
    _controlsGroup ctrlShow true;
    _map ctrlEnable false;
    [] call grad_aicommand_fnc_hideContextMenuItems;
    [_dialogPos,_waypoint] call grad_aicommand_fnc_createWaypointMenu;


} else {
    _display displayRemoveEventHandler ["MouseButtonDown",missionNamespace getVariable ["grad_aicommand_contextmenu_mousehandler",-1]];
    _controlsGroup ctrlShow false;
    _map ctrlEnable true;
};
