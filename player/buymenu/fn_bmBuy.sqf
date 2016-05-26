#include "buymenu_defines.sqf";
disableSerialization;

_dialog = findDisplay buymenu_DIALOG;
_itemDesc = _dialog displayCtrl buymenu_item_desc;
_moneyLeft = _dialog displayCtrl buymenu_money;
_itemData = call compile format ["bmItemData%1 select %2", bmCurrentCategory, bmCurrentItemID];

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
if (playerMoney < _price) exitWith {
  [_moneyLeft] spawn {
    disableSerialization;
    params ["_moneyLeft"];
    _moneyText = ctrlText _moneyLeft;
    asd = ctrlText _moneyLeft;
    _moneyLeft ctrlSetStructuredText parseText format ["<t size='0.5'>&#160;</t><br/><t color='#ff0000'>%1</t>",_moneyText];
    asd2 = ctrlText _moneyLeft;
    player say "AddItemFailed";
    sleep 0.4;
    _moneyLeft ctrlSetStructuredText parseText format	["<t size='0.5'>&#160;</t><br/><t size='1' align='center'>Funds: %1Cr&#160;&#160;</t>", playerMoney];
  };
};

//BUY ITEM =====================================================================
_itemCode = _itemData select 3;
playerMoney = playerMoney - _price;
[] call mcd_fnc_bmUpdateMoney;
[] call _itemCode;
