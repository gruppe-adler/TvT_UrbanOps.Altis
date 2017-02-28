[{!isNull player || isDedicated},{

    //init
    ace_map_BFT_Enabled = false;
    [] call uo_setup_fnc_setMissionParams;
    [] call uo_setup_fnc_setOriginalSide;
    [] call uo_setup_fnc_createCustomLocations;
    [{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call uo_init_fnc_pubVars}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call uo_init_fnc_loadoutFaction}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call uo_waverespawn_fnc_initWaveRespawn}, []] call CBA_fnc_waitUntilAndExecute;

    //setup on mission start
    [{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call uo_setup_fnc_setTime}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call uo_setup_fnc_setWeather}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call uo_setup_fnc_setMapRespawnPos}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call uo_setup_fnc_setupCountdown}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call uo_setup_fnc_createLocationMarkers}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call uo_choosePlayArea_fnc_chooseCity}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call uo_choosePlayArea_fnc_chooseSpawn}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call uo_setup_fnc_setMoney}, []] call CBA_fnc_waitUntilAndExecute;

    //exit JIP
    _westCondition = (count (missionNamespace getVariable ["uo_cv_allCVs",[]])) == 0;
    _eastCondition = (missionNamespace getVariable ["uo_DEALERKILLED",false]);
    if (hasInterface && missionNamespace getVariable ["uo_init_gamestarted", false] && {(playerSide == WEST && _westCondition) || (playerSide == EAST && _eastCondition)}) exitWith {player setDamage 1};

    //report
    if (isServer) then {[{["PRINT", "SERVER_SETUP"] call uo_common_fnc_diagReport}, [], 15] call CBA_fnc_waitAndExecute};

    //setup after player choices
    [{missionNamespace getVariable ["uo_init_cityChosen", false]}, {[] call uo_missionstart_fnc_playAreaSetup}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_cityChosen", false]}, {[] call uo_civs_fnc_initCivs}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_playAreaSetupDone", false]}, {[] call uo_missionstart_fnc_findOpfStartPos}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_opforSpawnSet", false]}, {[EAST] call uo_missionstart_fnc_tpSide}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_opforSpawnSet", false]}, {[EAST] call uo_missionstart_fnc_enableBFT}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_opforSpawnSet", false]}, {[] call uo_buyables_fnc_initPropagandaTowers}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_spawnChosen", false]}, {[BLUFORSPAWN] call uo_missionObjectives_fnc_createCommandVehicle}, []] call CBA_fnc_waitUntilAndExecute;
    [{(!isNil "CITYPOSITION" && !isNil "CITYAREASIZE")}, {[] call uo_missionstart_fnc_createTrigger}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_cvCreated", false]}, {[] call uo_missionstart_fnc_findBluStartPos}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_bluforSpawnSet", false]}, {[WEST] call uo_missionstart_fnc_tpSide}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_bluforSpawnSet", false]}, {[WEST] call uo_missionstart_fnc_enableBFT}, []] call CBA_fnc_waitUntilAndExecute;

    //on game start
    [{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_common_fnc_saveTeammembers}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_missionstart_fnc_createLegendMarkers}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_endings_fnc_checkBluKilled}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_endings_fnc_checkOpfKilled}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_endings_fnc_checkDefense}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_endings_fnc_checkCapture}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_endings_fnc_endMission}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[] call uo_civs_fnc_initPunishments}, []] call CBA_fnc_waitUntilAndExecute;
    [{missionNamespace getVariable ["uo_init_gamestarted", false]}, {[[EAST],"BLUFOR SPAWNED","Game started."] call uo_common_fnc_sideNotification}, []] call CBA_fnc_waitUntilAndExecute;

}, []] call CBA_fnc_waitUntilAndExecute;
