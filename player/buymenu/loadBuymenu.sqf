/*  Loads the buy menu
*
*/

if (isNil "originalSide") exitWith {"loadBuymenu.sqf - ERROR: PLAYER HAS NO originalSide"};

#include "buymenu_defines.sqf";
disableSerialization;

createDialog "buymenu";
_dialog = findDisplay buymenu_DIALOG;
_bmHighestCatID = call compile format ["BM_HIGHESTCATID_%1", originalSide];
_categoryVariableStr = format ["BM_CATEGORYNAME_%1_", originalSide];

for [{_i=0}, {_i<BM_MAXCATEGORIES}, {_i=_i+1}] do {
  //hide unused categories
  if (_i>_bmHighestCatID) then {
    [_dialog] call compile format ["params ['_dialog']; _category = _dialog displayCtrl 300%1; _category ctrlShow false", _i];

  //name categories
  } else {
    _categoryName = call compile (_categoryVariableStr + str _i);
    [_dialog] call compile format ["params ['_dialog']; _category =_dialog displayCtrl 300%1; _category ctrlSetText '%2'", _i, _categoryName];
  };
};

[] call mcd_fnc_bmUpdateMoney;
[] call mcd_fnc_bmDisplayPicture;
