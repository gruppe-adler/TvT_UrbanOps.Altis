/*  Loads the money transfer menu
*
*/

params ["_recipient"];

//set recipient
mmRecipient = _recipient;

#include "moneymenu_defines.sqf";
disableSerialization;

createDialog "moneymenu";
_dialog = findDisplay moneymenu_DIALOG;
_title = _dialog displayCtrl moneymenu_title;
_myMoney = _dialog displayCtrl moneymenu_myfunds;

//set title
_text = format ["Give Money to %1", (name _recipient)];
_title ctrlSetText _text;

//set own money
[] call mcd_fnc_mmUpdateMoney;
