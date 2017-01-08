params ["_side"];

_allPlayers = [] call BIS_fnc_listPlayers;
_numberOfTeammates = switch (_side) do {
    case ("WEST"): {
        west countside _allPlayers;
    };

    case ("EAST"): {
        east countside _allPlayers;
    };

    case ("GUER"): {
        independent countside _allPlayers;
    };

    case ("CIV"): {
        civilian countside _allPlayers;
    };

    default {
        0
    };
};

_numberOfTeammates
