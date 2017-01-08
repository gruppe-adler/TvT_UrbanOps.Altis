params [["_unit",objNull]];

_side = _unit getVariable ["originalSide", str side _unit];

_isCommander = switch (_side) do {
    case ("WEST"): {
        if (!isNil "bluforcommander") then {_unit == bluforcommander} else {false}
    };

    case ("EAST"): {
        if (!isNil "opforcommander") then {_unit == opforcommander} else {false}
    };

    default {
        false
    };
};

_isCommander
