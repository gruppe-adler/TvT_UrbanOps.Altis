#include "buymenu_defines.sqf";
disableSerialization;

_buymenuDialog = createDialog "buymenu";
_dialog = findDisplay buymenu_DIALOG;

for [{_i=0}, {_i<bmMaxCategories}, {_i=_i+1}] do {
  //hide unused categories
  if (_i>bmHighestCatID) then {
    [_dialog] call compile format ["params ['_dialog']; _category = _dialog displayCtrl 300%1; _category ctrlShow false", _i];

  //name categories
  } else {
    _categoryName = call compile format ["bmCategoryName%1", _i];
    [_dialog] call compile format ["params ['_dialog']; _category =_dialog displayCtrl 300%1; _category ctrlSetText '%2'", _i, _categoryName];
  };
};

[] call mcd_fnc_bmUpdateMoney;
[] call mcd_fnc_bmDisplayPicture;
