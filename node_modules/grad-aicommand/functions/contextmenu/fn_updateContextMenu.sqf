#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"


private _display = findDisplay GRAD_AICOMMAND_COMMANDWINDOW_DIALOG;
ctrlPosition (_display displayCtrl GRAD_AICOMMAND_CONTEXTMENU_GROUP) params ["_x","_y"];

private _groupMenuGroup = missionNamespace getVariable [QGVAR(groupMenuGroup),grpNull];
if (isNull _groupMenuGroup) then {};

private _currentWaypoint = _groupMenuGroup getVariable [QGVAR(selectedWaypoint),[]];
if (count _currentWaypoint == 0) then {
    [true,[_x,_y],_groupMenuGroup] call FUNC(openContextMenu);
} else {
    [true,[_x,_y],_currentWaypoint] call FUNC(openContextMenu);
};
