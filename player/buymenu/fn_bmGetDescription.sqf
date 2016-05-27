/*  Sets item description in buy menu.
*
*   Params:
*   0:  ControlID or Number --> determines mode
*       _mode = -1: clear description
*       _mode = 0: set description
*/

if (isNil "bmCurrentCategory") exitWith {"fn_bmGetDescription - ERROR: bmCurrentCategory UNDEFINED!"};

#include "buymenu_defines.sqf";
disableSerialization;

_mode = 0;
if (typeName (_this select 0) != "CONTROL") then {
  _mode = -1;
};

_dialog = findDisplay buymenu_DIALOG;
_itemlist = _dialog displayCtrl buymenu_item_list;
_itemDesc = _dialog displayCtrl buymenu_item_desc;
_buyButton = _dialog displayCtrl buymenu_buy;

_itemIndex = lbCurSel _itemlist;
if (_mode == -1 ||_itemIndex == -1) then {
  _itemDesc ctrlSetText "";
  _buyButton ctrlEnable false;
  bmCurrentItemID = -1;
} else {
  _itemData = call compile format ["BM_ITEMDATA_%1_%2 select %3", originalSide, bmCurrentCategory, _itemIndex];
  _itemAvailable = _itemData select 1;
  _description = _itemData select 3;

  _inStockText = if (_itemAvailable < 1) then {"<t color='#FF0000'>OUT OF STOCK</t><br/>"} else {format ["IN STOCK: %1<br/>", _itemAvailable]};
  _itemDesc ctrlSetStructuredText parseText (_inStockText + _description);

  if (_itemAvailable < 1) then {_buyButton ctrlEnable false} else {_buyButton ctrlEnable true};

  bmCurrentItemID = _itemIndex;
};
