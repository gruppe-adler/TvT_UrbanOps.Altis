params ["_unit","_faction","_unitClass"];
private ["_value"];

private _configValues = [] call CBA_fnc_hashCreate;
private _configPath = (missionConfigFile >> "cfgAIUnitLoadouts" >> _faction >> _unitClass);

{
    _possibleValues = [_configPath >> _x, "array", false] call  CBA_fnc_getConfigEntry;
    if (_possibleValues isEqualTo false) then {
        _value = [_configPath >> _x, "text", false] call  CBA_fnc_getConfigEntry;
    } else {
        _value = selectRandom _possibleValues;
    };

    if (!(_value isEqualTo false)) then {
        [_configValues, _x, _value] call CBA_fnc_hashSet;
    };
} forEach [
    "uniform",
    "vest",
    "backpack",
    "primaryWeapon",
    "primaryWeaponMuzzle",
    "primaryWeaponOptics",
    "primaryWeaponPointer",
    "primaryWeaponUnderbarrel",
    "secondaryWeapon",
    "secondaryWeaponMuzzle",
    "secondaryWeaponOptics",
    "secondaryWeaponPointer",
    "secondaryWeaponUnderbarrel",
    "handgunWeapon",
    "handgunWeaponMuzzle",
    "handgunWeaponOptics",
    "handgunWeaponPointer",
    "handgunWeaponUnderbarrel",
    "headgear",
    "goggles",
    "nvgoggles",
    "binoculars",
    "map",
    "gps",
    "compass",
    "watch",
    "radio"
];

{
    _value = [_configPath >> _x, "array", false] call  CBA_fnc_getConfigEntry;
    if (!(_value isEqualTo false)) then {
        [_configValues, _x, _value] call CBA_fnc_hashSet;
    };
} forEach [
    "addItemsToUniform",
    "addItemsToVest",
    "addItemsToBackpack"
];

_unit setUnitLoadout [[[],[],[],[],[],[],"","",[],["","","","","",""]],false];
[_configValues,_unit] call grad_loadout_fnc_doLoadout;
