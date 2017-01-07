#include "..\defines.hpp"

params [["_line1",""],["_line2","OK"]];
if (!hasInterface) exitWith {};

disableSerialization;
createDialog "uo_confirmHint";

_display = findDisplay uo_ch_DIALOG;
_l1 = _display displayCtrl uo_ch_TITLE;
_l2 = _display displayCtrl uo_ch_BUTTON;

_l1 ctrlSetText _line1;
_l2 ctrlSetText _line2;
