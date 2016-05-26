#include "buymenu_defines.sqf";
disableSerialization;

_dialog = findDisplay buymenu_DIALOG;
_moneyleft = _dialog displayCtrl buymenu_money;
_moneyleft ctrlSetStructuredText parseText format	["<t size='0.5'>&#160;</t><br/><t size='1' align='center'>Funds: %1Cr&#160;&#160;</t>", playerMoney];
