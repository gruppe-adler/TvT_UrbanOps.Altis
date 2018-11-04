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
    default {300};
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
_cityMarker = createMarker ["CITYAREAMARKER", CITYPOSITION];
_cityMarker setMarkerColor "COLOREAST";
_cityMarker setMarkerShape "ELLIPSE";
_cityMarker setMarkerBrush "Border";
_cityMarker setMarkerSize [CITYAREASIZE, CITYAREASIZE];

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
/*_marker = createMarker ["SECTORVERTICAL", CITYPOSITION];
_marker setMarkerColor "COLORBLACK";
_marker setMarkerShape "RECTANGLE";
_marker setMarkerBrush "Solid";
_marker setMarkerSize [1, CITYAREASIZE];

_marker = createMarker ["SECTORHORIZONTAL", CITYPOSITION];
_marker setMarkerColor "COLORBLACK";
_marker setMarkerShape "RECTANGLE";
_marker setMarkerBrush "Solid";
_marker setMarkerSize [CITYAREASIZE, 1];*/

//CREATE EXTRA MARKERS FOR BLUFOR ==============================================

[WEST,"STARTDISTMARKER",true,CITYPOSITION,"","COLORBLACK","","ELLIPSE",BLUFORSTARTDIST,1,"Border"] call uo_common_fnc_createSideMarker;
[WEST,"STARTDISTMARKER_TEXT",true,CITYPOSITION vectorAdd [0,BLUFORSTARTDIST,0],"hd_dot","COLORBLACK","START ZONE","ICON",1,1] call uo_common_fnc_createSideMarker;
[WEST,"STARTDISTMARKER_ARROW1",CITYPOSITION vectorAdd [0,BLUFORSTARTDIST+(BLUFORSPAWNBAND/2),0],0,"COLORBLACK",BLUFORSPAWNBAND] remoteExec ["uo_common_fnc_createArrowMarkerSide",0,false];

[WEST,"CAPTUREMARKER_TEXT",true,CITYPOSITION vectorAdd [0,CITYAREASIZE,0],"hd_dot","COLOREAST","CAPTURE ZONE","ICON",1,1] call uo_common_fnc_createSideMarker;
[WEST,"CAPTUREMARKER_ARROW1",CITYPOSITION vectorAdd [0,CITYAREASIZE/2,0],0,"COLOREAST",CITYAREASIZE] remoteExec ["uo_common_fnc_createArrowMarkerSide",0,false];
[WEST,"CAPTUREMARKER_ARROW2",CITYPOSITION vectorAdd [0,-(CITYAREASIZE/2),0],180,"COLOREAST",CITYAREASIZE] remoteExec ["uo_common_fnc_createArrowMarkerSide",0,false];

[WEST,"RESPAWNMARKER_TEXT",true,CITYPOSITION vectorAdd [0,BLUFORSPAWNDIST + BLUFORSPAWNBAND,0],"hd_dot","COLORWEST","RESPAWN ZONE","ICON",1,1] call uo_common_fnc_createSideMarker;
[WEST,"RESPAWNMARKER_ARROW1",CITYPOSITION vectorAdd [0,BLUFORSPAWNDIST + 0.75 * BLUFORSPAWNBAND,0],0,"COLORWEST",BLUFORSPAWNBAND/2] remoteExec ["uo_common_fnc_createArrowMarkerSide",0,false];
[WEST,"RESPAWNMARKER_ARROW2",CITYPOSITION vectorAdd [0,BLUFORSPAWNDIST + 0.25 * BLUFORSPAWNBAND,0],180,"COLORWEST",BLUFORSPAWNBAND/2] remoteExec ["uo_common_fnc_createArrowMarkerSide",0,false];

private _taskDescription = format ["Capture the location (red circle) within %1 minutes. Check your watch to see how much time you have left. To capture keep the ratio of BLUFOR to OPFOR units inside the circle above %2 for a total of %3 minutes.",[uo_missionParam_DEFENSETIME,"MM:SS"] call BIS_fnc_secondsToString, uo_missionParam_CONTROLRATIO, [uo_missionParam_CAPTURETIME,"MM:SS"] call BIS_fnc_secondsToString];
uo_missionstart_captureTask = [WEST,"uo_missionstart_captureTask",[_taskDescription,"Capture location",_cityMarker],CITYPOSITION,"AUTOASSIGNED",6,false,"attack"] call BIS_fnc_taskCreate;
private _taskDescription = format ["Defend the location (red circle) for %1 minutes. Don't let the ratio of BLUFOR to OPFOR units inside the circle go above %2 for longer than a total of %3 minutes. Check your watch to see how much time is left.",[uo_missionParam_DEFENSETIME,"MM:SS"] call BIS_fnc_secondsToString, uo_missionParam_CONTROLRATIO, [uo_missionParam_CAPTURETIME,"MM:SS"] call BIS_fnc_secondsToString];
uo_missionstart_defendTask = [EAST,"uo_missionstart_defendTask",[_taskDescription,"Defend location",_cityMarker],CITYPOSITION,"AUTOASSIGNED",6,false,"defend"] call BIS_fnc_taskCreate;

missionNamespace setVariable ["uo_init_playAreaSetupDone", true, true];
INFO("Play area setup complete.");
