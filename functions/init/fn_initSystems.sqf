//init
[] call mcd_fnc_setMissionParams;
[] call mcd_fnc_setOriginalSide;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_initPubVars}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_initLoadoutFaction}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call mcd_fnc_initWaveRespawn}, []] call CBA_fnc_waitUntilAndExecute;

//setup on mission start
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_setCommandVehicleClass}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_setTime}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_setWeather}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_setMapRespawnPos}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_setupCountdown}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call mcd_fnc_setLocationMarkers}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call mcd_fnc_chooseCity}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call mcd_fnc_chooseSpawn}, []] call CBA_fnc_waitUntilAndExecute;

//report
if (isServer) then {[{["PRINT", "SERVER_SETUP"] call mcd_fnc_diagReport}, [], 15] call CBA_fnc_waitAndExecute};

//setup after player choices
[{missionNamespace getVariable ["uo_init_cityChosen", false]}, {[] call mcd_fnc_playAreaSetup}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_cityChosen", false]}, {[] call mcd_fnc_initCivs}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_playAreaSetupDone", false]}, {[] call mcd_fnc_findOpfStartPos}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_opforSpawnSet", false]}, {[EAST] call mcd_fnc_tpSide}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_bluforSpawnSet", false]}, {[WEST] call mcd_fnc_tpSide}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_spawnChosen", false]}, {[BLUFORSPAWN] call mcd_fnc_createCommandVehicle}, []] call CBA_fnc_waitUntilAndExecute;
[{(!isNil "CITYPOSITION" && !isNil "CITYAREASIZE")}, {[] call mcd_fnc_createTrigger}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_cvCreated", false]}, {[] call mcd_fnc_findBluStartPos}, []] call CBA_fnc_waitUntilAndExecute;

//start ending checks
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call mcd_fnc_endByBluKilled}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call mcd_fnc_endByOpfKilled}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call mcd_fnc_endByTimeout}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call mcd_fnc_endByControl}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call mcd_fnc_endMission}, []] call CBA_fnc_waitUntilAndExecute;
