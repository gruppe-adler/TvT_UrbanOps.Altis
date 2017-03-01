#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\contextmenu\defines.hpp"

params ["_display","_idc","_controlsGroup","_text","_pos","_statement"];

_button = if (isNull (_controlsGroup controlsGroupCtrl _idc)) then {
    _display ctrlCreate ["RscButtonMenu",_idc,_controlsGroup];
} else {
    _controlsGroup controlsGroupCtrl _idc;
};


_button ctrlShow true;
_button ctrlSetText _text;
_button ctrlSetPosition _pos;
_button ctrlSetEventHandler ["ButtonClick",_statement];
_button ctrlCommit 0;

_button
