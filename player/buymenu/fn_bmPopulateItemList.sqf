#include "buymenu_defines.sqf";
disableSerialization;
params ["_categoryID"];

bmCurrentCategory = _categoryID;

_dialog = findDisplay buymenu_DIALOG;
_listCtrl = _dialog displayCtrl buymenu_item_list;
lbClear _listCtrl ;

_categoryData = call compile format ["bmItemData%1", _categoryID];

for [{_i=0}, {_i<(count _categoryData)}, {_i=_i+1}] do {
	_itemData = _categoryData select _i;
	_itemName = _itemData select 0;
	_itemPrice = _itemData select 1;
	_itemDesc = _itemData select 2;
	_listCtrl lbAdd format ["%2Cr - %1", _itemName, _itemPrice];
	_listCtrl lbSetData [_i, _itemDesc];
};

[-1] call mcd_fnc_bmGetDescription;
[] call mcd_fnc_bmDisplayPicture
