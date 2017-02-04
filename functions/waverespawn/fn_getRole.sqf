params ["_unit"];

_type = typeOf _unit;
_role = switch (true) do {
    case (getText(configFile >> "CfgWeapons" >> _type >> "UIPicture") == "\a3\weapons_f\data\ui\icon_mg_ca.paa"): {
        "MG"
    };
    case (getText(configFile >> "CfgWeapons" >> _type >> "UIPicture") == "\a3\weapons_f\data\ui\icon_at_ca.paa"): {
        "AT"
    };
    case (getNumber(configFile >> "CfgVehicles" >> _type >> "attendant") == 1): {
        "MEDIC"
    };
    default {
        "RIFLEMAN"
    };
};

_role
