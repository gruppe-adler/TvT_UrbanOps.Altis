if (hasInterface) then {

  //functions
  mcd_fnc_formattedHint = compile preprocessFileLineNumbers "functions\fn_formattedHint.sqf";
  mcd_fnc_startSpectator = compile preProcessFileLineNumbers "functions\fn_startSpectator.sqf";
  mcd_fnc_strToLoadout = compile preprocessFileLineNumbers "functions\fn_strToLoadout.sqf";
  mcd_fnc_createSideMarkerRemote = compile preprocessFileLineNumbers "functions\fn_createSideMarkerRemote.sqf";
  mcd_fnc_deleteSideMarkerRemote = compile preprocessFileLineNumbers "functions\fn_deleteSideMarkerRemote.sqf";
  mcd_fnc_teleport = compile preprocessFileLineNumbers "functions\fn_teleport.sqf";
  mcd_fnc_findOpfSpawnPos = compile preprocessFileLineNumbers "functions\fn_findOpfSpawnPos.sqf";

  //dyn groups
  ["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

  //setup
  [] execVM "helpers\originalSide.sqf";
  [] execVM "player\setup\chooseCity.sqf";
  [] execVM "player\setup\chooseSpawn.sqf";
  [] execVM "player\captureTimeCountdown.sqf";
  [] execVM "player\endMission.sqf";
  [] execVM "loadouts\loadoutinit.sqf";

  //register in respawn system
  if (!isServer) then {
    [] execVM "initWaveRespawn.sqf";
  };
};
