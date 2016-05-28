/*  Updates own money in moneymenu
*
*/

#include "moneymenu_defines.sqf";
disableSerialization;

_playerMoney = player getVariable "playerMoney";

_dialog = findDisplay moneymenu_DIALOG;
_myMoney = _dialog displayCtrl moneymenu_myfunds;

_text = format ["%1 Cr", _playerMoney];
_myMoney ctrlSetText _text;
