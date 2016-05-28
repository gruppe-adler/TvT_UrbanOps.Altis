/*  Receives money send with fnc_mmSendMoney
*
*/

params ["_recipient", "_amount", "_sender"];
if (player != _recipient) exitWith {};

_playerMoney = player getVariable "playerMoney";
_playerMoney = _playerMoney + _amount;
player setVariable ["playerMoney", _playerMoney];

[[format ["%1 gave you", (name _sender)], [format ["%1 Cr.", _amount], "#00FF00"]]] call mcd_fnc_formattedHint;
