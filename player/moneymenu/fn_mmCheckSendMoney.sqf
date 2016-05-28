#include "moneymenu_defines.sqf";
disableSerialization;

if (isNil "mmRecipient") exitWith {diag_log "fn_mmCheckSendMoney - ERROR: mmRecipient UNDEFINED."};

_playerMoney = player getVariable "playerMoney";
_dialog = findDisplay moneymenu_DIALOG;
_inputBox = _dialog displayCtrl moneymenu_input;
_amount = ctrlText _inputBox;

_amount = round (parseNumber _amount);

//invalid input
if (_amount <= 0) exitWith {
  player say "AddItemFailed";
  [_inputBox] spawn {
    params ["_inputBox"];
    disableSerialization;
    _inputBox ctrlSetTextColor [1,0,0,1];
    sleep 0.4;
    _inputBox ctrlSetTextColor [1,1,1,1];
  };
};

//not enough money
if (_playerMoney < _amount) then {
  _amount = _playerMoney;
};

//valid input
[mmRecipient, _amount] call mcd_fnc_mmSendMoney;
[] call mcd_fnc_mmUpdateMoney;
