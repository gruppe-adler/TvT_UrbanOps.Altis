#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"

params ["_dialogPos","_waypoint"];

_display = findDisplay grad_aicommand_commandwindow_DIALOG;
_map = _display displayCtrl grad_aicommand_commandwindow_MAP;
_controlsGroup = _display displayCtrl grad_aicommand_contextmenu_GROUP;


_idc = grad_aicommand_contextmenu_GROUP + 1;
_buttonW = grad_aicommand_contextmenu_ButtonW;
_buttonH = grad_aicommand_contextmenu_ButtonH;
_xButton = 0;
_yButton = 0;
_dialogPos params ["_xCG","_yCG"];
_waypoint params ["_wpPos","_wpSpeed","_wpTimeout","_wpType","_wpStatements"];


_controlsGroup ctrlSetPosition [_xCG,_yCG,safezoneW,safeZoneH];
_controlsGroup ctrlCommit 0;
_map ctrlShow false;
_map ctrlShow true;


_create = {
    [_display,_idc,_controlsGroup,_text,[_xButton,_yButton,_buttonW,_buttonH],_statement] call grad_aicommand_fnc_createButton;
    _idc = _idc + 1;
    _yButton = _yButton + _buttonH*1.05;
};

_text = format ["TYPE (%1)",_wpType];
_statement = "[_this select 0, 'TYPE',[
    ['MOVE',""['MOVE'] call grad_aicommand_fnc_setWPType;""],
    ['CYCLE',""['CYCLE'] call grad_aicommand_fnc_setWPType;""],
    ['GETIN NEAREST',""['GETIN NEAREST'] call grad_aicommand_fnc_setWPType;""],
    ['GETOUT',""['GETOUT'] call grad_aicommand_fnc_setWPType;""]
]] call grad_aicommand_fnc_createSubMenu";
call _create;

_text = format ["SPEED (%1)",_wpSpeed];
_statement = "[_this select 0, 'SPEED',[
    ['UNCHANGED',""['UNCHANGED'] call grad_aicommand_fnc_setWPSpeed;""],
    ['LIMITED',""['LIMITED'] call grad_aicommand_fnc_setWPSpeed;""],
    ['NORMAL',""['NORMAL'] call grad_aicommand_fnc_setWPSpeed;""],
    ['FULL',""['FULL'] call grad_aicommand_fnc_setWPSpeed;""]
]] call grad_aicommand_fnc_createSubMenu";
call _create;

_text = format ["WAIT (%1 SECONDS)",_wpTimeout select 0];
_statement = "[_this select 0, 'WAIT',[
    ['0s',""[0] call grad_aicommand_fnc_setWPTimeout;""],
    ['30s',""[30] call grad_aicommand_fnc_setWPTimeout;""],
    ['60s',""[60] call grad_aicommand_fnc_setWPTimeout;""],
    ['90s',""[90] call grad_aicommand_fnc_setWPTimeout;""],
    ['120s',""[120] call grad_aicommand_fnc_setWPTimeout;""],
    ['180s',""[180] call grad_aicommand_fnc_setWPTimeout;""],
    ['240s',""[240] call grad_aicommand_fnc_setWPTimeout;""],
    ['300s',""[300] call grad_aicommand_fnc_setWPTimeout;""]
]] call grad_aicommand_fnc_createSubMenu";
call _create;

_text = format ["ACTION (%1)",_wpStatements select 2];
_statement = "[_this select 0, 'STATEMENT',[
    ['NONE',""['true','','NONE'] call grad_aicommand_fnc_setWPStatement;""],
    ['SEARCH NEARBY',""['true','[group this] call CBA_fnc_searchNearby','SEARCH NEARBY'] call grad_aicommand_fnc_setWPStatement;""],
    ['DEFEND',""['true','[group this] call CBA_fnc_taskDefend','DEFEND'] call grad_aicommand_fnc_setWPStatement;""],
    ['GARRISON',""['true','[group this,getPos this] call grad_aicommand_fnc_waypointGarrison','GARRISON'] call grad_aicommand_fnc_setWPStatement;""],
    ['RANDOM PATROL (50m)',""['true','[group this,getPos this,50] call CBA_fnc_taskPatrol','PATROL (50m)'] call grad_aicommand_fnc_setWPStatement;""],
    ['RANDOM PATROL (100m)',""['true','[group this,getPos this,100] call CBA_fnc_taskPatrol','PATROL (100m)'] call grad_aicommand_fnc_setWPStatement;""],
    ['RANDOM PATROL (200m)',""['true','[group this,getPos this,200] call CBA_fnc_taskPatrol','PATROL (200m)'] call grad_aicommand_fnc_setWPStatement;""],
    ['RANDOM PATROL (400m)',""['true','[group this,getPos this,400] call CBA_fnc_taskPatrol','PATROL (400m)'] call grad_aicommand_fnc_setWPStatement;""]
]] call grad_aicommand_fnc_createSubMenu";
call _create;

_text = "DELETE WAYPOINT";
_statement = "
    grad_aicommand_isDeleteClick = true;
    [{grad_aicommand_isDeleteClick = false}, [], 1] call CBA_fnc_waitAndExecute;
    [] call grad_aicommand_fnc_deleteWP;
    [false] call grad_aicommand_fnc_openContextMenu;
";
call _create;

_text = "DELETE ALL WAYPOINTs";
_statement = "
    grad_aicommand_isDeleteClick = true;
    [{grad_aicommand_isDeleteClick = false}, [], 1] call CBA_fnc_waitAndExecute;
    ['ALL'] call grad_aicommand_fnc_deleteWP;
    [false] call grad_aicommand_fnc_openContextMenu;
";
call _create;
