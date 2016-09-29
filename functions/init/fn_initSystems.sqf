//init
[] call mcd_fnc_setMissionParams;
[] call mcd_fnc_setOriginalSide;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_initPubVars}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_initLoadoutFaction}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call mcd_fnc_initWaveRespawn}, []] call CBA_fnc_waitUntilAndExecute;

//setup on mission start
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call mcd_fnc_setLocationMarkers}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_setCommandVehicle}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_setTime}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_setWeather}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_setMapRespawnPos}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_setupCountdown}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call mcd_fnc_chooseCity; [] call mcd_fnc_chooseSpawn}, []] call CBA_fnc_waitUntilAndExecute;

//report
if (isServer) then {[{["PRINT", "SERVER_SETUP"] call mcd_fnc_diagReport}, [], 15] call CBA_fnc_waitAndExecute};

//setup after player choices
[{(!isNil "CHOSENLOCATION" && !isNil "CITYCHOSEN")}, {[] call mcd_fnc_playAreaSetup; [] call mcd_fnc_findOpfStartPos}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_opforSpawnSet", false]}, {[] call mcd_fnc_tpOpfor}, []] call CBA_fnc_waitUntilAndExecute;
[{(!isNil "BLUFORSPAWN" && !isNil "SPAWNCHOSEN")}, {[] call mcd_fnc_tpBlufor}, []] call CBA_fnc_waitUntilAndExecute;
