if (!isServer) exitWith {};

CITYPOSITION = locationPosition CHOSENLOCATION;
publicVariable "CITYPOSITION";

CITYAREASIZE = switch (type CHOSENLOCATION) do {
    case "NameVillage": {VILLAGEMARKERSIZE};
    case "NameCity": {CITYMARKERSIZE};
    case "NameCityCapital": {CAPITALMARKERSIZE};
    case "NameLocal": {OTHERMARKERSIZE};
};
publicVariable "CITYAREASIZE";

AIAREASIZE = CITYAREASIZE + 0.6 * CITYAREASIZE;
publicVariable "AIAREASIZE";

//DELETE LOCATION MARKERS ======================================================
{
    deleteMarker _x;
} forEach LOCATIONMARKERS;

//CREATE PLAY AREA MARKERS =====================================================
//city area
_marker = createMarker ["CITYAREAMARKER", CITYPOSITION];
_marker setMarkerColor "COLOREAST";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "Border";
_marker setMarkerSize [CITYAREASIZE, CITYAREASIZE];

//blufor distance
_marker = createMarker ["BLUFORSPAWNINNER", CITYPOSITION];
_marker setMarkerColor "COLORWEST";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "Border";
_marker setMarkerSize [BLUFORSPAWNDIST, BLUFORSPAWNDIST];

_marker = createMarker ["BLUFORSPAWNOUTER", CITYPOSITION];
_marker setMarkerColor "COLORWEST";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "Border";
_marker setMarkerSize [BLUFORSPAWNDIST+BLUFORSPAWNBAND, BLUFORSPAWNDIST+BLUFORSPAWNBAND];


//CREATE EXPLANATION MARKERS FOR BLUFOR ========================================
[
    WEST,
    "EXPLANATIONMARKER_CAPTURE",
    true,
    CITYPOSITION,
    "",
    "COLOREAST",
    "",
    "RECTANGLE",
    [CITYAREASIZE,5],
    1,
    "SolidFull"
] call uo_fnc_createSideMarker;

[
    WEST,
    "EXPLANATIONMARKER_CAPTURE_TEXT",
    true,
    CITYPOSITION vectorAdd [CITYAREASIZE,0,0],
    "hd_dot",
    "COLOREAST",
    "CAPTURE ZONE",
    "ICON",
    1,
    1
] call uo_fnc_createSideMarker;

[
    WEST,
    "EXPLANATIONMARKER_RESPAWN",
    true,
    CITYPOSITION vectorAdd [-(BLUFORSPAWNDIST + 0.5 * BLUFORSPAWNBAND), 0,0],
    "",
    "COLORWEST",
    "",
    "RECTANGLE",
    [BLUFORSPAWNBAND/2,5],
    1,
    "SolidFull"
] call uo_fnc_createSideMarker;

[
    WEST,
    "EXPLANATIONMARKER_RESPAWN_TEXT",
    true,
    CITYPOSITION vectorAdd [- BLUFORSPAWNDIST, 0,0],
    "hd_dot",
    "COLORWEST",
    "RESPAWN ZONE",
    "ICON",
    1,
    1
] call uo_fnc_createSideMarker;

missionNamespace setVariable ["uo_init_playAreaSetupDone", true, true];
diag_log "fn_playAreaSetup - Player area set up.";
