player setVariable ["grad_lbm_myFunds", 90000];

enableSaving [false, false];
enableEngineArtillery false;

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;



/*
//functions
uo_fnc_formattedHint = compile preprocessFileLineNumbers "functions\fn_formattedHint.sqf";
uo_fnc_startSpectator = compile preProcessFileLineNumbers "functions\fn_startSpectator.sqf";
uo_fnc_strToLoadout = compile preprocessFileLineNumbers "functions\fn_strToLoadout.sqf";
uo_fnc_createSideMarker = compile preprocessFileLineNumbers "functions\fn_createSideMarker.sqf";
uo_fnc_deleteSideMarker = compile preprocessFileLineNumbers "functions\fn_deleteSideMarker.sqf";
uo_fnc_createSideMarkerRemote = compile preprocessFileLineNumbers "functions\fn_createSideMarkerRemote.sqf";
uo_fnc_deleteSideMarkerRemote = compile preprocessFileLineNumbers "functions\fn_deleteSideMarkerRemote.sqf";
uo_fnc_teleport = compile preprocessFileLineNumbers "functions\fn_teleport.sqf";
uo_fnc_findOpfSpawnPos = compile preprocessFileLineNumbers "functions\fn_findOpfSpawnPos.sqf";

KK_fnc_fileExists = compile preprocessFileLineNumbers "functions\fn_fileExists.sqf";


//setup
[] execVM "player\captureTimeCountdown.sqf";
[] execVM "player\endMission.sqf";
[] execVM "player\buymenu\buymenuInit.sqf";
[] execVM "player\moneymenu\moneymenuInit.sqf";
