#define PREFIX uo
#define COMPONENT missionstart
#include "\x\cba\addons\main\script_macros_mission.hpp"

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

//sectors
_marker = createMarker ["SECTORVERTICAL", CITYPOSITION];
_marker setMarkerColor "COLORBLACK";
_marker setMarkerShape "RECTANGLE";
_marker setMarkerBrush "Solid";
_marker setMarkerSize [1, CITYAREASIZE];

_marker = createMarker ["SECTORHORIZONTAL", CITYPOSITION];
_marker setMarkerColor "COLORBLACK";
_marker setMarkerShape "RECTANGLE";
_marker setMarkerBrush "Solid";
_marker setMarkerSize [CITYAREASIZE, 1];

//CREATE EXTRA MARKERS FOR BLUFOR ==============================================

[WEST,"STARTDISTMARKER",true,CITYPOSITION,"","COLORBLACK","","ELLIPSE",BLUFORSTARTDIST,1,"Border"] call uo_common_fnc_createSideMarker;
[WEST,"STARTDISTMARKER_TEXT",true,CITYPOSITION vectorAdd [0,BLUFORSTARTDIST,0],"hd_dot","COLORBLACK","START ZONE","ICON",1,1] call uo_common_fnc_createSideMarker;
[WEST,"STARTDISTMARKER_ARROW1",CITYPOSITION vectorAdd [0,BLUFORSTARTDIST+300,0],0,"COLORBLACK",600] remoteExec ["uo_common_fnc_createArrowMarkerSide",0,false];

[WEST,"CAPTUREMARKER_TEXT",true,CITYPOSITION vectorAdd [0,CITYAREASIZE,0],"hd_dot","COLOREAST","CAPTURE ZONE","ICON",1,1] call uo_common_fnc_createSideMarker;
[WEST,"CAPTUREMARKER_ARROW1",CITYPOSITION vectorAdd [0,CITYAREASIZE/2,0],0,"COLOREAST",CITYAREASIZE] remoteExec ["uo_common_fnc_createArrowMarkerSide",0,false];
[WEST,"CAPTUREMARKER_ARROW2",CITYPOSITION vectorAdd [0,-(CITYAREASIZE/2),0],180,"COLOREAST",CITYAREASIZE] remoteExec ["uo_common_fnc_createArrowMarkerSide",0,false];

[WEST,"RESPAWNMARKER_TEXT",true,CITYPOSITION vectorAdd [0,BLUFORSPAWNDIST + BLUFORSPAWNBAND,0],"hd_dot","COLORWEST","RESPAWN ZONE","ICON",1,1] call uo_common_fnc_createSideMarker;
[WEST,"RESPAWNMARKER_ARROW1",CITYPOSITION vectorAdd [0,BLUFORSPAWNDIST + 0.75 * BLUFORSPAWNBAND,0],0,"COLORWEST",BLUFORSPAWNBAND/2] remoteExec ["uo_common_fnc_createArrowMarkerSide",0,false];
[WEST,"RESPAWNMARKER_ARROW2",CITYPOSITION vectorAdd [0,BLUFORSPAWNDIST + 0.25 * BLUFORSPAWNBAND,0],180,"COLORWEST",BLUFORSPAWNBAND/2] remoteExec ["uo_common_fnc_createArrowMarkerSide",0,false];

missionNamespace setVariable ["uo_init_playAreaSetupDone", true, true];
INFO("Play area setup complete.");
