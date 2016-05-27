/*  Configures items for Dealer and Commandvehicle
*
*   ["ITEMNAME", PRICE, AVAILABLE AMOUNT, "DESCRIPTION", {CODE}, "PICTURE/CLASSNAME"]
*/

waitUntil {!isNil "BLUFORFACTION"};
waitUntil {!isNil "OPFORFACTION"};

//max. number of supported categories in bm dialog
BM_MAXCATEGORIES = 6;

//GET ITEMS ====================================================================
//call west items
_westPath = format ["server\buymenu\WEST_%1.sqf", BLUFORFACTION];
call compile preprocessFileLineNumbers _westPath;

//call east items
_eastPath = format ["server\buymenu\EAST_%1.sqf", OPFORFACTION];
call compile preprocessFileLineNumbers _eastPath;


//BROADCAST ====================================================================
publicVariable "BM_MAXCATEGORIES";
publicVariable "BM_HIGHESTCATID_WEST";
publicVariable "BM_HIGHESTCATID_EAST";

_allBroadcasted = false;
_ID = 0;
_total = 0;
while {!_allBroadcasted} do {
  _allBroadcasted = true;

  _variable = format ["BM_CATEGORYNAME_WEST_%1", _ID];
  if (!isNil _variable) then {
    publicVariable _variable;
    _allBroadcasted = false;
    _total = _total + 1;
  };

  _variable = format ["BM_ITEMDATA_WEST_%1", _ID];
  if (!isNil _variable) then {
    publicVariable _variable;
    _allBroadcasted = false;
    _total = _total + 1;
  };

  _variable = format ["BM_CATEGORYNAME_EAST_%1", _ID];
  if (!isNil _variable) then {
    publicVariable _variable;
    _allBroadcasted = false;
    _total = _total + 1;
  };

  _variable = format ["BM_ITEMDATA_EAST_%1", _ID];
  if (!isNil _variable) then {
    publicVariable _variable;
    _allBroadcasted = false;
    _total = _total + 1;
  };

  _ID = _ID + 1;
};

diag_log format ["bm_itemConfig.sqf - Done. %1 variables broadcasted.", _total];
