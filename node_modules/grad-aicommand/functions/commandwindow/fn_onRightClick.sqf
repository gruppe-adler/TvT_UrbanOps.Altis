#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"

params ["_mapCtrl","_button","_x","_y","_shift","_alt","_ctrl"];

_mousePosWorld = _mapCtrl ctrlMapScreenToWorld [_x,_y];
_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];
_currentWaypoints = (group _currentUnit) getVariable ["grad_aicommand_currentWaypoints",[]];
_nearestWaypointID = [_mousePosWorld, _currentWaypoints,1000] call grad_aicommand_fnc_findNearestWP;

// >0 because original position is a wp, but should not have a context menu
if (_nearestWaypointID > 0) then {
    _wpWorldPos = (_currentWaypoints select _nearestWaypointID) select 0;
    _wpScreenPos = _mapCtrl ctrlMapWorldToScreen _wpWorldPos;
    _clickDistance = _wpScreenPos distance [_x,_y];

    if (_clickDistance < 0.02) then {
        missionNamespace setVariable ["grad_aicommand_selectedWaypoint",_nearestWaypointID];
        _dialogPos = _mapCtrl ctrlMapWorldToScreen _wpWorldPos;
        [true,_dialogPos,_currentWaypoints select _nearestWaypointID] call grad_aicommand_fnc_openContextMenu;
    };
};
