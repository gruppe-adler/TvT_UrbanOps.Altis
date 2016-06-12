/*  Executed on player when buying a weapon
*
*   Parameters:
*   0:  buyer (object)
*   1:  originalSide (string)
*   2:  weapon classname (string)
*
*/

params ["_player", "_side", "_weapon", ["_attachment1", ""], ["_attachment2", ""]];
if (player != _player) exitWith {};
if (originalSide != _side) exitWith {};

_type = getNumber (configFile >> "CfgWeapons" >> _weapon >> "Type");
_cargospace = if (originalSide == "WEST") then {COMMANDVEHICLE} else {DEALERWEPHOLDER};
_cargospacetext = if (originalSide == "WEST") then {"in the command vehicle."} else {"on the floor."};

diag_log format ["fn_buyWeapon - Weapon %1 is type %2.", _weapon, _type];

//primary
if (_type == 1) then {
  if (primaryWeapon player == "") then {
    player addWeapon _weapon;
    player addPrimaryWeaponItem _attachment1;
    player addPrimaryWeaponItem _attachment2;
  } else {
    [["You already have a weapon."], ["Your purchase is " + _cargospacetext]] call mcd_fnc_formattedHint;
    player say "taskSucceeded";
    _cargospace addWeaponCargoGlobal [_weapon, 1];
    _cargospace addItemCargoGlobal [_attachment1, 1];
    _cargospace addItemCargoGlobal [_attachment2, 1];
  };
};

//handgun
if (_type == 2) then {
  if (handgunWeapon player == "") then {
    player addWeapon _weapon;
    player addHandgunItem _attachment1;
    player addHandgunItem _attachment2;
  } else {
    [["You already have a pistol."], ["Your purchase is " + _cargospacetext]] call mcd_fnc_formattedHint;
    player say "taskSucceeded";
    _cargospace addWeaponCargoGlobal [_weapon, 1];
    _cargospace addItemCargoGlobal [_attachment1, 1];
    _cargospace addItemCargoGlobal [_attachment2, 1];
  };
};

//launcher
if (_type == 4) then {
  if (secondaryWeapon player == "") then {
    player addWeapon _weapon;
    player addSecondaryWeaponItem _attachment1;
    player addSecondaryWeaponItem _attachment2;
  } else {
    [["You already have a launcher."], ["Your purchase is " + _cargospacetext]] call mcd_fnc_formattedHint;
    player say "taskSucceeded";
    _cargospace addWeaponCargoGlobal [_weapon, 1];
    _cargospace addItemCargoGlobal [_attachment1, 1];
    _cargospace addItemCargoGlobal [_attachment2, 1];
  };
};
