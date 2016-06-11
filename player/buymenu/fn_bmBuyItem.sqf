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

_isMagazine = isClass (configfile >> "CfgMagazines" >> "rhs_mag_smaw_HEAA");
if (_isMagazine) then {
  [["Not enough inventory space."], ["Your purchase is " + _cargospacetext]] call mcd_fnc_formattedHint;
  player say "taskSucceeded";
  _cargospace addMagazineCargoGlobal [_item, 1];
} else {
  [["Not enough inventory space."], ["Your purchase is " + _cargospacetext]] call mcd_fnc_formattedHint;
  player say "taskSucceeded";
  _cargospace addItemCargoGlobal [_item, 1];
};
