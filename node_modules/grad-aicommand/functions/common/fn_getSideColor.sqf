params [["_side",sideUnknown]];

private _color = switch (_side) do {
    case (WEST): {
        [0,0.3,0.6,1]
    };
    case (EAST): {
    	[0.5,0,0,1]
    };
    case (INDEPENDENT): {
        [0,0.5,0,1]
    };
    default {
        [0.7,0.6,0,1]
    };
};

_color
