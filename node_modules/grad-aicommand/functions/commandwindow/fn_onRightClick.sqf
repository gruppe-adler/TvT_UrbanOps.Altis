#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"


params ["_mapCtrl","_button","_x","_y","_shift","_alt","_ctrl"];

private _mousePosWorld = _mapCtrl ctrlMapScreenToWorld [_x,_y];

private _currentGroups = missionNamespace getVariable [QGVAR(currentGroups),[]];
if (count _currentGroups == 0) exitWith {};


// create waypoint =============================================================
if (_shift) then {
    {
        _thisGroup = _x;
        private _wp = _thisGroup addWaypoint [_mousePosWorld,0];
        _wp setWaypointType "MOVE";

        private _garrisonedUnits = (units _thisGroup) select {_x getVariable ["ace_ai_garrisonned",false]};
        if (count _garrisonedUnits > 0) then {
            [_garrisonedUnits] remoteExecCall [QFUNC(unGarrison),0,false];
        };

        [_wp,_thisGroup] call GVAR(onWaypointCreated);
    } forEach _currentGroups;


// contextmenu =================================================================
} else {

    private _nearestWaypoint = [_mousePosWorld, _currentGroups] call FUNC(findNearestWP);
    private _nearestGroup = [_mousePosWorld] call FUNC(findNearestEditableGroup);


    // null waypoint is empty array
    if (count _nearestWaypoint == 0 && isNull _nearestGroup) exitWith {};

    private _fnc_wp = {
        _wpWorldPos = waypointPosition _nearestWaypoint;
        _wpScreenPos = _mapCtrl ctrlMapWorldToScreen _wpWorldPos;

        _clickDistance = _wpScreenPos distance [_x,_y];
        if (_clickDistance < 0.02) then {
            _nearestWaypoint params [["_waypointGroup",grpNull]];

            _waypointGroup setVariable [QGVAR(selectedWaypoint),_nearestWaypoint];
            [true,_wpScreenPos,_nearestWaypoint] call FUNC(openContextMenu);

            [_nearestWaypoint,_waypointGroup] call GVAR(onWaypointSelected);
        };
    };

    private _fnc_grp = {
        _grpWorldPos = getPos leader _nearestGroup;
        _grpScreenPos = _mapCtrl ctrlMapWorldToScreen _grpWorldPos;

        _clickDistance = _grpScreenPos distance [_x,_y];
        if (_clickDistance < 0.02) then {
            [true,_grpScreenPos,_nearestGroup] call FUNC(openContextMenu);
        };
    };


    if (count _nearestWaypoint > 0 && !isNull _nearestGroup) then {
        _wpWorldPos = waypointPosition _nearestWaypoint;
        _grpWorldPos = getPos leader _nearestGroup;
        if (_wpWorldPos distance2D _mousePosWorld < _grpWorldPos distance2D _mousePosWorld) then _fnc_wp else _fnc_grp;

    } else {
        if (count _nearestWaypoint > 0) then _fnc_wp else _fnc_grp;
    };
};
