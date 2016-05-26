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

_itemIndex = lbCurSel _itemlist;
if (_mode == -1) then {
  _itemDesc ctrlSetText "";
  bmCurrentItemID = -1;
} else {
  _itemData = call compile format ["bmItemData%1 select %2", bmCurrentCategory, _itemIndex];
  _description = _itemData select 2;
  _itemDesc ctrlSetStructuredText parseText _description;
  bmCurrentItemID = _itemIndex;
};
