#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"

params ["_unit","_player"];

(group _unit) setVariable ["grad_aicommand_isBeingEdited",true,true];
missionNamespace setVariable ["grad_aicommand_currentUnit",_unit];
if (isNil {(group _unit) getVariable "grad_aicommand_currentWaypoints"}) then {
    (group _unit) setVariable ["grad_aicommand_currentWaypoints",[[getPos _unit,"UNCHANGED",[0,0,0],"MOVE",["true",""]]]];
};

createDialog "grad_aicommand_commandwindow";
_display = findDisplay grad_aicommand_commandwindow_DIALOG;
_map = _display ctrlCreate ["RscMapControl",grad_aicommand_commandwindow_MAP];
_map ctrlSetPosition [safeZoneX,safeZoneY,safeZoneW,safeZoneH];
_map ctrlCommit 0;
_contextmenu = _display ctrlCreate ["RscControlsGroupNoScrollbars",grad_aicommand_contextmenu_GROUP];
_contextmenu ctrlShow false;

[_display,_map] call grad_aicommand_fnc_addEHs;

_map ctrlAddEventHandler ["Draw",{_this call grad_aicommand_fnc_drawArrows}];
_map ctrlAddEventHandler ["Draw",{_this call grad_aicommand_fnc_drawCurrentUnits}];
