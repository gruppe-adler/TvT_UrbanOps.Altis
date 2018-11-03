#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"

params ["_dialogPos","_group"];

if (isNull _group) exitWith {};

private _display = findDisplay GRAD_AICOMMAND_COMMANDWINDOW_DIALOG;
private _map = _display displayCtrl GRAD_AICOMMAND_COMMANDWINDOW_MAP;
private _controlsGroup = _display displayCtrl GRAD_AICOMMAND_CONTEXTMENU_GROUP;

private _idc = GRAD_AICOMMAND_CONTEXTMENU_GROUP + 1;
private _buttonW = GRAD_AICOMMAND_CONTEXTMENU_BUTTONW;
private _buttonH = GRAD_AICOMMAND_CONTEXTMENU_BUTTONH;
private _xButton = 0;
private _yButton = 0;

_dialogPos params ["_xCG","_yCG"];

_controlsGroup ctrlSetPosition [_xCG,_yCG,safezoneW,safeZoneH];
_controlsGroup ctrlCommit 0;
_map ctrlShow false;
_map ctrlShow true;

private _fnc_create = {
    _button = [_display,_idc,_controlsGroup,[_xButton,_yButton,_buttonW,_buttonH],_statement,_text] call FUNC(createButton);
    _idc = _idc + 1;
    _yButton = _yButton + _buttonH * 1.05;

    if (!isNil "_update") then {
        [_button,_update] call _fnc_update;
    };
};

private _fnc_update = {
    [{
        params ["_args","_handle"];
        _args params ["_button","_update"];

        if (isNull _button || !ctrlShown _button) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
        _button call _update;
    },0,_this] call CBA_fnc_addPerFrameHandler;
};



private _text = "RENAME GROUP";
private _update = nil;
private _statement = QUOTE([false] call FUNC(openContextMenu); [true] call FUNC(toggleRenameGroupDialog););
call _fnc_create;

_text = "MERGE GROUP";
_update = nil;
_statement = QUOTE([ARR_2(_this select 0,'MERGE GROUP')] call FUNC(createJoinGroupSubmenu););
call _fnc_create;

_text = "";
_update = {_this ctrlSetText (["PAUSE WAYPOINTS","RESUME WAYPOINTS"] select ((missionNamespace getVariable [QGVAR(currentGroup),grpNull]) getVariable [QGVAR(isPaused),false]))};
_statement = QUOTE( \
    _group = missionNamespace getVariable [ARR_2(QQGVAR(currentGroup),grpNull)]; \
    [ARR_2(_group,!(_group getVariable [ARR_2(QQGVAR(isPaused),false)]))] call FUNC(pauseWaypoints); \
    [false] call FUNC(openContextMenu); \
);
call _fnc_create;

_text = "";
_update = {_this ctrlSetText (["SHOW UNITS","STOP SHOWING UNITS"] select ((missionNamespace getVariable [QGVAR(currentGroup),grpNull]) in GVAR(individualUnitsGroups)))};
_statement = QUOTE([] call FUNC(setGroupIndividualUnits); [false] call FUNC(openContextMenu););
call _fnc_create;

_text = "KICK UNIT";
_update = nil;
_statement = QUOTE([ARR_2(_this select 0,'KICK UNIT')] call FUNC(createKickUnitSubmenu););
call _fnc_create;

_text = "DELETE ALL WAYPOINTS";
_statement = QUOTE( \
    ['ALL'] call FUNC(deleteWP); \
    [false] call FUNC(openContextMenu); \
);
call _fnc_create;
