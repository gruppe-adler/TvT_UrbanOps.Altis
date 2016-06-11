#include "buymenu_defines.sqf";
disableSerialization;
_categoryID = param [0, bmCurrentCategory];
_side = param [1, "UNDEF"];

if (_side != "UNDEF" && originalSide != _side) exitWith {};
if (isNull findDisplay 2009) exitWith {};

_dialog = findDisplay buymenu_DIALOG;
_listCtrl = _dialog displayCtrl buymenu_item_list;
_curSel = lbCurSel _listCtrl;
lbClear _listCtrl ;

_categoryData = call compile format ["BM_ITEMDATA_%1_%2", originalSide, _categoryID];
_itemAmount = call compile format ["BM_ITEMAMOUNT_%1_%2", originalSide, _categoryID];

for [{_i=0}, {_i<(count _categoryData)}, {_i=_i+1}] do {
	_itemData = _categoryData select _i;
	_itemName = _itemData select 0;
	_itemPrice = _itemData select 1;
	_itemDesc = _itemData select 2;
	_itemAvailable = _itemAmount select _i;

	_listCtrl lbAdd format ["%1Cr - %2", _itemPrice, _itemName];
	_listCtrl lbSetData [_i, _itemDesc];
	if (_itemAvailable < 1) then {_listCtrl lbSetColor [_i, [0.4,0.4,0.4,1]]};
};

_listCtrl lbsetcursel _curSel;
