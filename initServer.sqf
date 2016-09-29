["Initialize", [true]] call BIS_fnc_dynamicGroups;

[] execVM "tfarsettings.sqf";
[
  "setup\setTime.sqf",
  "setup\setWeather.sqf",
  "setup\setMapRespawnPos.sqf",
  "setup\setupCountdown.sqf",
  {["PRINT", "SERVER SETUP"] call mcd_fnc_diagReport}
] call mcd_fnc_sequentialInit;





/*
//Setup ======================================================================
[] execVM "server\buymenu\bm_itemConfig.sqf";
[] execVM "server\setup\allLocationMarkers.sqf";
[] execVM "server\setup\chosenCityListener.sqf";
[] execVM "server\setup\chosenSpawnListener.sqf";
[] execVM "server\setup\chooseCommandVehicle.sqf";
[] execVM "server\setup\createCivilians.sqf";
[] execVM "server\setup\setupCountdown.sqf";

//Main =======================================================================
[] execVM "initWaveRespawn.sqf";
[] execVM "server\endByControl.sqf";
[] execVM "server\endByTimeout.sqf";
[] execVM "server\endByBluKilled.sqf";
[] execVM "server\endByOpfKilled.sqf";
