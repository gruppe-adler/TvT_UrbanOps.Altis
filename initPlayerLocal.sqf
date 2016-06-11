player setVariable ["playerMoney",20000];

enableSaving [false, false];
call compile preprocessFile "islandConfig.sqf";

//functions
mcd_fnc_formattedHint = compile preprocessFileLineNumbers "functions\fn_formattedHint.sqf";
mcd_fnc_startSpectator = compile preProcessFileLineNumbers "functions\fn_startSpectator.sqf";
mcd_fnc_strToLoadout = compile preprocessFileLineNumbers "functions\fn_strToLoadout.sqf";
mcd_fnc_createSideMarker = compile preprocessFileLineNumbers "functions\fn_createSideMarker.sqf";
mcd_fnc_deleteSideMarker = compile preprocessFileLineNumbers "functions\fn_deleteSideMarker.sqf";
mcd_fnc_createSideMarkerRemote = compile preprocessFileLineNumbers "functions\fn_createSideMarkerRemote.sqf";
mcd_fnc_deleteSideMarkerRemote = compile preprocessFileLineNumbers "functions\fn_deleteSideMarkerRemote.sqf";
mcd_fnc_teleport = compile preprocessFileLineNumbers "functions\fn_teleport.sqf";
mcd_fnc_findOpfSpawnPos = compile preprocessFileLineNumbers "functions\fn_findOpfSpawnPos.sqf";

KK_fnc_fileExists = compile preprocessFileLineNumbers "functions\fn_fileExists.sqf";


//dyn groups
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

//setup
[] execVM "helpers\originalSide.sqf";
[] execVM "player\setup\mapStartPos.sqf";
[] execVM "player\setup\chooseCity.sqf";
[] execVM "player\setup\chooseSpawn.sqf";
[] execVM "player\captureTimeCountdown.sqf";
[] execVM "player\endMission.sqf";
[] execVM "player\buymenu\buymenuInit.sqf";
[] execVM "player\moneymenu\moneymenuInit.sqf";
[] execVM "loadouts\loadoutinit.sqf";


//register in respawn system
if (!isServer) then {
  [] execVM "initWaveRespawn.sqf";
};
