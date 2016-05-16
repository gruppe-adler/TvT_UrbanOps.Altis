bluforLoadoutPath = "";
bluforLoadoutParams = "[]";
opforLoadoutPath = "";
opforLoadoutParams = "[]";
indepLoadoutPath = "";
indepLoadoutParams = "[]";

if (hasInterface) then {

  mcd_fnc_formattedHint = compile preprocessFileLineNumbers "functions\fn_formattedHint.sqf";
  mcd_fnc_startSpectator = compile preProcessFileLineNumbers "functions\fn_startSpectator.sqf";
  mcd_fnc_strToLoadout = compile preprocessFileLineNumbers "functions\fn_strToLoadout.sqf";

  [] execVM "player\setup\chooseCity.sqf";
  [] execVM "player\setup\chooseSpawn.sqf";
  [] execVM "player\captureTimeCountdown.sqf";
  [] execVM "player\endMission.sqf";
  [] execVM "loadouts\loadoutinit.sqf";
  [] execVM "helpers\originalSide.sqf";
};

if (!isServer) then {
  [] execVM "initWaveRespawn.sqf";
};
