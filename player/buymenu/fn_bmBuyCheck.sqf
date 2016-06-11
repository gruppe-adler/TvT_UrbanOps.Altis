#include "buymenu_defines.sqf";
disableSerialization;

_dialog = findDisplay buymenu_DIALOG;
_itemDesc = _dialog displayCtrl buymenu_item_desc;
_moneyLeft = _dialog displayCtrl buymenu_money;
_itemData = call compile format ["BM_ITEMDATA_%1_%2 select %3", originalSide, bmCurrentCategory, bmCurrentItemID];
_playerMoney = player getVariable "playerMoney";

//NO ITEM SELECTED =============================================================
if (bmCurrentItemID == -1) exitWith {
  [_itemDesc] spawn {
    disableSerialization;
    params ["_itemDesc"];
    _errorMessage = "Please select an item!";
    _itemDesc ctrlSetStructuredText parseText format ["<t color='#ff0000'>%1</t>",_errorMessage];
    player say "AddItemFailed";
    sleep 2;
    if (ctrlText _itemDesc == _errorMessage) then {_itemDesc ctrlSetText ""};
  };
};

//NOT ENOUGH MONEY =============================================================
_price = _itemData select 1;
if (_playerMoney < _price) exitWith {
  [_moneyLeft] spawn {
    disableSerialization;
    params ["_moneyLeft"];
    _moneyText = ctrlText _moneyLeft;
    _moneyLeft ctrlSetStructuredText parseText format ["<t size='0.5'>&#160;</t><br/><t color='#ff0000'>%1</t>",_moneyText];
    player say "AddItemFailed";
    sleep 0.4;
    _moneyLeft ctrlSetStructuredText parseText format	["<t size='0.5'>&#160;</t><br/><t size='1' align='center'>Funds: %1Cr&#160;&#160;</t>", __playerMoney];
  };
};

//BUY ITEM =====================================================================
_playerMoney = _playerMoney - _price;
player setVariable ["playerMoney", _playerMoney];
[] call mcd_fnc_bmUpdateMoney;

//send to server
[player, originalSide, bmCurrentCategory, bmCurrentItemID] remoteExec ["mcd_fnc_bmBuyServer", 2, false];
