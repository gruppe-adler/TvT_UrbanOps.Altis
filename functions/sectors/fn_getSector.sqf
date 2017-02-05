params ["_pos"];

_sectorID = switch (true) do {
    case (CITYPOSITION distance2D _pos > CITYAREASIZE): {-1};
    case (CITYPOSITION getDir _pos < 90): {0};
    case (CITYPOSITION getDir _pos < 180): {1};
    case (CITYPOSITION getDir _pos < 270): {2};
    case (CITYPOSITION getDir _pos < 360): {3};
    default {-1};
};

_sectorID
