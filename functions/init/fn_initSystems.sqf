//init
[] call uo_fnc_setMissionParams;
[] call uo_fnc_setOriginalSide;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call uo_fnc_initPubVars}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call uo_fnc_initLoadoutFaction}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call uo_fnc_initWaveRespawn}, []] call CBA_fnc_waitUntilAndExecute;

//setup on mission start
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call uo_fnc_setCommandVehicleClass}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call uo_fnc_setTime}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call uo_fnc_setWeather}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call uo_fnc_setMapRespawnPos}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call uo_fnc_setupCountdown}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call uo_fnc_setLocationMarkers}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call uo_fnc_chooseCity}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call uo_fnc_chooseSpawn}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call uo_fnc_setMoney}, []] call CBA_fnc_waitUntilAndExecute;

//report
if (isServer) then {[{["PRINT", "SERVER_SETUP"] call uo_fnc_diagReport}, [], 15] call CBA_fnc_waitAndExecute};

//setup after player choices
[{missionNamespace getVariable ["uo_init_cityChosen", false]}, {[] call uo_fnc_playAreaSetup}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_cityChosen", false]}, {[] call uo_fnc_initCivs}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_playAreaSetupDone", false]}, {[] call uo_fnc_findOpfStartPos}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_opforSpawnSet", false]}, {[EAST] call uo_fnc_tpSide}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_bluforSpawnSet", false]}, {[WEST] call uo_fnc_tpSide}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_spawnChosen", false]}, {[BLUFORSPAWN] call uo_fnc_createCommandVehicle}, []] call CBA_fnc_waitUntilAndExecute;
[{(!isNil "CITYPOSITION" && !isNil "CITYAREASIZE")}, {[] call uo_fnc_createTrigger}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_cvCreated", false]}, {[] call uo_fnc_findBluStartPos}, []] call CBA_fnc_waitUntilAndExecute;

//on game start
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_fnc_saveTeammembers}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_fnc_endByBluKilled}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_fnc_endByOpfKilled}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_fnc_endByTimeout}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_fnc_endByControl}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_fnc_endMission}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_fnc_civKillPunishments}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_fnc_createCivLegendMarkers}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[[EAST],"BLUFOR SPAWNED","Game started."] call uo_fnc_sideNotification}, []] call CBA_fnc_waitUntilAndExecute;
