#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"

params ["_display","_button","_xPos","_yPos","_shift","_ctrl","_alt"];

if (_button == 1) exitWith {true};

private _isOverContextMenu = false;

private _controlsGroup = _display displayCtrl GRAD_AICOMMAND_CONTEXTMENU_GROUP;
private _idc = GRAD_AICOMMAND_CONTEXTMENU_GROUP + 1;
ctrlPosition _controlsGroup params ["_ctrlCgX","_ctrlCgY"];

while {!isNull (_controlsGroup controlsGroupCtrl _idc)} do {

    // for some weird reason, some of these variables (_ctrlX, _ctrlY, ...) were nil after the params command
	/* (ctrlPosition (_controlsGroup controlsGroupCtrl _idc)) params [["_ctrlX",0],["_ctrlY",0],["_ctrlW,",0],["_ctrlH",0]]; */

    _control = _controlsGroup controlsGroupCtrl _idc;
    _controlPosition = (ctrlPosition _control);
    _ctrlX = _controlPosition param [0,0];
    _ctrlY = _controlPosition param [1,0];
    _ctrlW = _controlPosition param [2,0];
    _ctrlH = _controlPosition param [3,0];

	if (
        ctrlShown _control &&
		{_xPos >= (_ctrlCgX + _ctrlX)} &&
		{_xPos <= (_ctrlCgX + _ctrlX + _ctrlW)} &&
		{_yPos >= _ctrlCgY + _ctrlY} &&
		{_yPos <= (_ctrlCgY + _ctrlY + _ctrlH)}
	) exitWith {
		_isOverContextMenu = true;
	};

	_idc = _idc + 1;
};

if (_isOverContextMenu) exitWith {true};

_idc = GRAD_AICOMMAND_CONTEXTMENU_SUBMENU + 1;
while {!isNull (_controlsGroup controlsGroupCtrl _idc)} do {

    // see above
	/* (ctrlPosition (_controlsGroup controlsGroupCtrl _idc)) params [["_ctrlX",0],["_ctrlY",0],["_ctrlW,",0],["_ctrlH",0]]; */

    _control = _controlsGroup controlsGroupCtrl _idc;
    _controlPosition = (ctrlPosition _control);
    _ctrlX = _controlPosition param [0,0];
    _ctrlY = _controlPosition param [1,0];
    _ctrlW = _controlPosition param [2,0];
    _ctrlH = _controlPosition param [3,0];

	if (
        ctrlShown _control &&
		{_xPos >= (_ctrlCgX + _ctrlX)} &&
		{_xPos <= (_ctrlCgX + _ctrlX + _ctrlW)} &&
		{_yPos >= _ctrlCgY + _ctrlY} &&
		{_yPos <= (_ctrlCgY + _ctrlY + _ctrlH)}
	) exitWith {
		_isOverContextMenu = true;
	};

	_idc = _idc + 1;
};

if (_isOverContextMenu) exitWith {true};

[false] call grad_aicommand_fnc_openContextMenu;

private _currentGroups = missionNamespace getVariable [QGVAR(currentGroups),[]];
if (count _currentGroups > 0) then {
    {_x setVariable [QGVAR(selectedWaypoint),nil]} forEach _currentGroups;
};
