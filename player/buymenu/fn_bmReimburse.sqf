/*  Reimburses player, if someone else pressed buy at the same time and the item went out of stock
*
*   remote executed by server
*/

params ["_unit", "_itemName", "_itemPrice"];
if (player != _unit) exitWith {};

_playerMoney = player getVariable "playerMoney";
_playerMoney = _playerMoney + _itemPrice;
player setVariable ["playerMoney", _playerMoney];

[["Sorry!"],["Someone else was faster."], [format ["Here is your %1Cr back.", _itemPrice]]] call mcd_fnc_formattedHint;
