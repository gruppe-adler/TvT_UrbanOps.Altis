#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"

_display = findDisplay grad_aicommand_commandwindow_DIALOG;
ctrlPosition (_display displayCtrl grad_aicommand_contextmenu_GROUP) params ["_x","_y"];

/*[false] call grad_aicommand_fnc_openContextMenu;*/

_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];
_currentWaypoints = (group _currentUnit) getVariable ["grad_aicommand_currentWaypoints",[]];
_wpIndex = missionNamespace getVariable ["grad_aicommand_selectedWaypoint",-1];
if (_wpIndex < 0) exitWith {};
_wp = _currentWaypoints select _wpIndex;


[true,[_x,_y],_wp] call grad_aicommand_fnc_openContextMenu;
/*[{isNull ((_this select 0) displayCtrl grad_aicommand_contextmenu_GROUP)}, {(_this select 1) call grad_aicommand_fnc_openContextMenu}, [_display,[true,[_x,_y],_wp]]] call CBA_fnc_waitUntilAndExecute;*/
