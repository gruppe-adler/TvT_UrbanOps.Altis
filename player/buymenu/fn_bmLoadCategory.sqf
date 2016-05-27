#include "buymenu_defines.sqf";
disableSerialization;
params ["_categoryID"];

bmCurrentCategory = _categoryID;

_dialog = findDisplay buymenu_DIALOG;
_itemlist = _dialog displayCtrl buymenu_item_list;
_itemlist lbSetCurSel -1;

[_categoryId] call mcd_fnc_bmPopulateItemList;
[-1] call mcd_fnc_bmGetDescription;
[] call mcd_fnc_bmDisplayPicture
