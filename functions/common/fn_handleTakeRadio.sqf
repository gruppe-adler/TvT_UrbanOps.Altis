params ["_unit","_container","_item"];

_isRadio = (
    (_item isKindOf "TFAR_Bag_Base") ||
    (_item isKindOf ["ItemRadio", configFile >> "CfgWeapons"])
);
if (!_isRadio) exitWith {};

_isBackpack = _item isKindOf "TFAR_Bag_Base";

_encryptionCode = if (_isBackpack) then {
    getText (configfile >> "CfgVehicles" >> _item >> "tf_encryptionCode")
} else {
    getText (configfile >> "CfgWeapons" >> _item >> "tf_encryptionCode")
};
if (_encryptionCode == "") exitWith {};


_radioSide = switch (_encryptionCode) do {
    case ("tf_west_radio_code"): {west};
    case ("tf_guer_radio_code"): {independent};
    case ("tf_east_radio_code"): {east};
    default {playerSide};
};


if (_isBackpack) then {
    if (_radioSide != playerSide) then {
        systemChat "You cannot take this radio.";
        if (backpack player == _item) then {removeBackpackGlobal player} else {player removeItem _item};
    };
} else {
    if (_radioSide != playerSide) then {
        systemChat "You cannot take this radio.";
        player removeItem _item;
        player unlinkItem _item;
        (if (isNull _container) then {createVehicle ["groundWeaponHolder", getPos player, [], 0, "can_Collide"]} else {_container}) addItemCargoGlobal [_item,1];
    };
};
