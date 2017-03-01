#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"

_display = findDisplay grad_aicommand_commandwindow_DIALOG;
_map = _display displayCtrl grad_aicommand_commandwindow_MAP;
_controlsGroup = _display displayCtrl grad_aicommand_contextmenu_GROUP;

//delete old menu items
_idc = grad_aicommand_contextmenu_GROUP + 1;
while {!isNull (_controlsGroup controlsGroupCtrl _idc)} do {
    (_controlsGroup controlsGroupCtrl _idc) ctrlShow false;
    (_controlsGroup controlsGroupCtrl _idc) ctrlCommit 0;
    _idc = _idc + 1;
};
_idc = grad_aicommand_contextmenu_SUBMENU + 1;
while {!isNull (_controlsGroup controlsGroupCtrl _idc)} do {
    (_controlsGroup controlsGroupCtrl _idc) ctrlShow false;
    (_controlsGroup controlsGroupCtrl _idc) ctrlCommit 0;
    _idc = _idc + 1;
};
