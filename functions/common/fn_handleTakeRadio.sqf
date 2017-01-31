params ["_unit","_container","_item"];
if !(_item isKindOf ["ItemRadio", configFile >> "CfgWeapons"]) exitWith {};

_encryptionCode = getText (configfile >> "CfgWeapons" >> _item >> "tf_encryptionCode");
if (_encryptionCode == "") exitWith {};

_radioSide = switch (_encryptionCode) do {
    case ("tf_west_radio_code"): {west};
    case ("tf_guer_radio_code"): {independent};
    case ("tf_east_radio_code"): {east};
    default {playerSide};
};

if (_radioSide != playerSide) then {
    systemChat "You cannot take this radio.";
    player removeItem _item;
    player unlinkItem _item;
    _container addItemCargoGlobal [_item,1];
};
