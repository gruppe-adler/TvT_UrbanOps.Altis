[] call mcd_fnc_setMissionParams;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_initPubVars}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_missionParamsDone", false]}, {[] call mcd_fnc_initLoadoutFaction}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call mcd_fnc_initLocationMarkers}, []] call CBA_fnc_waitUntilAndExecute;
[{missionNamespace getVariable ["uo_init_pubVarsDone", false]}, {[] call mcd_fnc_initWaveRespawn}, []] call CBA_fnc_waitUntilAndExecute;
