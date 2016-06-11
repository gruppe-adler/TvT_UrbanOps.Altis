/*  Handles players buying from shop
*
*   Parameters:
*   0:  buyer (object)
*   1:  originalSide (string)
*   2:  category (number)
*   3:  item ID (number)
*
*   remote executed on server by buyer:
*   [player, originalSide, bmCurrentCategory, bmCurrentItemID] remoteExec ["mcd_fnc_bmBuyServer", 2, false];
*/

params ["_unit", "_side", "_category", "_itemID"];

diag_log str _this;

_dataArray = format ["BM_ITEMDATA_%1_%2", _side, _category];
_itemAmount = call compile format ["BM_ITEMAMOUNT_%1_%2", _side, _category];
_itemData = (call compile _dataArray) select _itemID;
_itemName = _itemData select 0;
_itemAvailable = _itemAmount select _itemID;
_itemPrice = _itemData select 1;
_code = _itemData select 3;
_remoteExecTarget = if (hasInterface) then {0} else {-2};

//reimburse and exit if item out of stock
if (_itemAvailable < 1) exitWith {
  [_unit, _itemName, _itemPrice] remoteExec ["mcd_fnc_bmReimburse", _remoteExecTarget, false];
  diag_log format ["fn_bmBuyServer - Player %1 of side %2 tried to buy %3, category %4, but it was out of stock.", name _unit, _side, _itemName, _category];
};

//detract from stock
call compile format ["BM_ITEMAMOUNT_%1_%2 set [%3, %4]; publicVariable 'BM_ITEMAMOUNT_%1_%2'", _side, _category, _itemID, _itemAvailable - 1];

//call code
[_unit, _side] call _code;

//make players update list
[nil, _side] remoteExec ["mcd_fnc_bmPopulateItemList", _remoteExecTarget, false];

diag_log format ["fn_bmBuyServer - Player %1 of side %2 bought %3, category %4.", name _unit, _side, _itemName, _category];
