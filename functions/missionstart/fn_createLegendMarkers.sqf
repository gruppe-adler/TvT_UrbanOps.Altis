if (!hasInterface) exitWith {};

_legendMarkers = if (side player == WEST) then {
    [
        ["o_inf", "COLOREAST", "= enemy infantry", WEST],
        ["o_hq", "COLOREAST", "= the dealer", WEST],
        ["b_hq", "COLORWEST", "= commandvehicle", WEST]
    ]
} else {
    [
        ["b_inf", "COLORWEST", "= enemy infantry", EAST],
        ["b_hq", "COLORWEST", "= enemy command vehicle", EAST],
        ["mil_marker", "COLOREAST", "= the dealer", EAST]
    ]
};


{_x call uo_common_fnc_createLegendMarker} forEach _legendMarkers;
