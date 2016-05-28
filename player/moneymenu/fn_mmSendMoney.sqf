params ["_recipient", "_amount"];

_error = false;
_playerMoney = player getVariable "playerMoney";

if (typeName _amount == "STRING") then {
  if (_amount == "all") then {
    _amount = _playerMoney;
  } else {
    _error = true;
  };
};
if (_error) exitWith {diag_log format ["fn_mmSendMoney - ERROR: PARAMETER 'AMOUNT' IS (%1) INSTEAD OF A NUMBER.", _amount]};
if (isNull _recipient) exitWith {diag_log "fn_mmSendMoney - ERROR: PARAMETER 'RECIPIENT' IS NULL."};
if (_amount <= 0) exitWith {player say "AddItemFailed"};

_playerMoney = _playerMoney - _amount;
player setVariable ["playerMoney", _playerMoney];
[_recipient, _amount, player] remoteExec ["mcd_fnc_mmReceiveMoney", 0, false];

[[format ["%1 Cr", _amount], "#00FF00"], [format ["given to %1.", (name _recipient)]]] call mcd_fnc_formattedHint;
