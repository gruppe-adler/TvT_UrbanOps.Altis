#include "buymenu_defines.sqf";
private ["_picturePath"];
disableSerialization;

_dialog = findDisplay buymenu_DIALOG;
_picCtrl = _dialog displayCtrl buymenu_item_picture;
_picBGCtrl = _dialog displayCtrl buymenu_item_pictureBG;

if (bmCurrentItemID == -1) exitWith {_picBGCtrl ctrlSetBackgroundColor [0, 0, 0, 0.3]; _picCtrl ctrlSetText ""};

_picBGCtrl ctrlSetBackgroundColor [1, 1, 1, 0.3];
_itemData = call compile format ["BM_ITEMDATA_%1_%2 select %3", originalSide, bmCurrentCategory, bmCurrentItemID];
_picture = _itemData select 4;

_isPath = [".paa", _picture, false] call BIS_fnc_inString;
if (_isPath) then {
  _picturePath = _picture;


} else {
  _picturePath = getText (configFile >> "CfgWeapons" >> _picture >> "picture");
  if (_picturePath == "") then {
    _picturePath = getText (configFile >> "CfgWeapons" >> _picture >> "uipicture");
  };
};

_picCtrl ctrlSetText _picturePath;
/*_picCtrl ctrlSetText "\A3\Weapons_F_gamma\Smgs\pdw2000\data\UI\gear_pdw2X_X_CA.paa";*/
