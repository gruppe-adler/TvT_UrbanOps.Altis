#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"

_display = findDisplay GRAD_AICOMMAND_COMMANDWINDOW_DIALOG;
_map = _display displayCtrl GRAD_AICOMMAND_COMMANDWINDOW_MAP;
_controlsGroup = _display displayCtrl GRAD_AICOMMAND_CONTEXTMENU_GROUP;

//delete old menu items
_idc = GRAD_AICOMMAND_CONTEXTMENU_GROUP + 1;
while {!isNull (_controlsGroup controlsGroupCtrl _idc)} do {
    (_controlsGroup controlsGroupCtrl _idc) ctrlShow false;
    (_controlsGroup controlsGroupCtrl _idc) ctrlCommit 0;
    _idc = _idc + 1;
};
_idc = GRAD_AICOMMAND_CONTEXTMENU_SUBMENU + 1;
while {!isNull (_controlsGroup controlsGroupCtrl _idc)} do {
    (_controlsGroup controlsGroupCtrl _idc) ctrlShow false;
    (_controlsGroup controlsGroupCtrl _idc) ctrlCommit 0;
    _idc = _idc + 1;
};
