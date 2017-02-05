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
        player action ["DropBag",_container,_item];
    };
} else {
    if (_radioSide != playerSide) then {
        systemChat "You cannot take this radio.";
        player removeItem _item;
        player unlinkItem _item;
        _container addItemCargoGlobal [_item,1];
    };
};
