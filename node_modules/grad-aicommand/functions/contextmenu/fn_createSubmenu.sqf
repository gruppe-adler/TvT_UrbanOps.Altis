#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"

params ["_parent","_mode","_menuItems"];

/* private _groupIDC = switch (_mode) do {
    case ("TYPE"): {grad_aicommand_contextmenu_TypeCG};
    case ("SPEED"): {grad_aicommand_contextmenu_SpeedCG};
    case ("WAIT"): {grad_aicommand_contextmenu_WaitCG};
    case ("STATEMENT"): {grad_aicommand_contextmenu_StatementCG};
}; */

private _display = findDisplay GRAD_AICOMMAND_COMMANDWINDOW_DIALOG;
private _controlsGroup = _display displayCtrl GRAD_AICOMMAND_CONTEXTMENU_GROUP;

(ctrlPosition _parent) params ["_parentX","_parentY","_parentW","_parentH"];

private _idc = GRAD_AICOMMAND_CONTEXTMENU_SUBMENU + 1;
while {!isNull (_controlsGroup controlsGroupCtrl _idc)} do {
    ctrlDelete (_controlsGroup controlsGroupCtrl _idc);
    _idc = _idc + 1;
};

private _idc = GRAD_AICOMMAND_CONTEXTMENU_SUBMENU + 1;
private _buttonW = GRAD_AICOMMAND_CONTEXTMENU_BUTTONW;
private _buttonH = GRAD_AICOMMAND_CONTEXTMENU_BUTTONH;
private _xButton = _parentX + _parentW * 1.01;
private _yButton = _parentY;

private _fnc_create = {
    [_display,_idc,_controlsGroup,[_xButton,_yButton,_buttonW,_buttonH],_statement,_text] call FUNC(createButton);
    _idc = _idc + 1;
    _yButton = _yButton + _buttonH * 1.05;
};

{
    _x params ["_text","_statement"];
    _statement = _statement + " [] call grad_aicommand_fnc_updateContextMenu";
    call _fnc_create;
    false
} count _menuItems;
