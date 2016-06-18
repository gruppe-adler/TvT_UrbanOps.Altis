/*  Executed on player when buying item
*
*   Parameters:
*   0:  buyer (object)
*   1:  originalSide (string)
*   2:  item classname (string)
*
*/

params ["_player", "_side", "_item"];
if (player != _player) exitWith {};
if (originalSide != _side) exitWith {};

_cargospace = if (originalSide == "WEST") then {COMMANDVEHICLE} else {DEALERWEPHOLDER};
_cargospacetext = if (originalSide == "WEST") then {"in the command vehicle."} else {"on the floor."};

if (player canAddItemToVest _item) exitWith {
  player addItemToVest _item;
};

if (player canAddItemToUniform _item) exitWith {
  player addItemToUniform _item;
};

if (player canAddItemToBackpack _item) exitWith {
  player addItemToBackpack _item;
};

//add magazine
_isMagazine = isClass (configfile >> "CfgMagazines" >> _item);
if (_isMagazine) exitWith {
  [["Not enough inventory space."], ["Your purchase is " + _cargospacetext]] call mcd_fnc_formattedHint;
  player say "taskSucceeded";
  _cargospace addMagazineCargoGlobal [_item, 1];
};

//add backpack
_isBackpack = (getNumber (configfile >> "CfgVehicles" >> _item >> "isBackpack") == 1);
if (_isBackpack) exitWith {
  if (backpack player == "") then {
    player addBackpackGlobal _item;
  } else {
    [["You already have a backpack."], ["Your purchase is " + _cargospacetext]] call mcd_fnc_formattedHint;
    player say "taskSucceeded";
    _cargospace addBackpackCargoGlobal [_item, 1];
  };
};

//add item
[["Not enough inventory space."], ["Your purchase is " + _cargospacetext]] call mcd_fnc_formattedHint;
player say "taskSucceeded";
_cargospace addItemCargoGlobal [_item, 1];
