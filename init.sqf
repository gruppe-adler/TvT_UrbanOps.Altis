//DEBUGDEBUGDEBUGDEBUGDEBUGDEBUG
CHOSENLOCATION = nearestLocation [[13991.4,18699.7,0], "NameCity"];
CITYCHOSEN = true;

call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
call compile preprocessFile "islandConfig.sqf";

mcd_fnc_createSideMarker = compile preprocessFileLineNumbers "functions\fn_createSideMarker.sqf";
mcd_fnc_createSideMarkerRemote = compile preprocessFileLineNumbers "functions\fn_createSideMarkerRemote.sqf";
mcd_fnc_deleteSideMarker = compile preprocessFileLineNumbers "functions\fn_deleteSideMarker.sqf";
mcd_fnc_deleteSideMarkerRemote = compile preprocessFileLineNumbers "functions\fn_deleteSideMarkerRemote.sqf";
mcd_fnc_emptyContainer = compile preprocessFileLineNumbers "functions\fn_emptyContainer.sqf";
mcd_fnc_spawnStaticCivilian = compile preprocessFileLineNumbers "functions\spawnStaticCivilian.sqf";

//SERVER ONLY ==================================================================
if (isServer) then {

	//Parameters
	WEATHER_SETTING = "WeatherSetting" call BIS_fnc_getParamValue;
	TIME_OF_DAY = "TimeOfDay" call BIS_fnc_getParamValue;
	CONTROLRATIO = "ControlRatio" call BIS_fnc_getParamValue;
	CAPTURETIME = "CaptureTime" call BIS_fnc_getParamValue;
	BLUFORFACTION = (getArray (missionConfigFile >> "Params" >> "BluforFaction" >> "values")) select ("BluforFaction" call BIS_fnc_getParamValue);
	OPFORFACTION = (getArray (missionConfigFile >> "Params" >> "OpforFaction" >> "values")) select ("OpforFaction" call BIS_fnc_getParamValue);
	ISWOODLAND = (ISLAND_CONFIG select (ISLANDS find worldName)) select 0;

	//Settings
	VILLAGEMARKERSIZE = 200;
	CITYMARKERSIZE = 300;
	CAPITALMARKERSIZE = 400;
	OTHERMARKERSIZE = 200;

	BLUFORSPAWNDIST = 1200;
	BLUFORSPAWNBAND = 1000;

	CIVILIANPROBABILITY = 5;

	GAMESTARTED = false;
	GAMEENDED = false;
	OPFORTELEPORTED = false;
	BLUFORTELEPORTED = false;
	BLUFORINCONTROL = false;
	CITYCAPTURED = false;
	COMMANDVEHICLEDESTROYED = false;

	publicVariable "WEATHER_SETTING";
	publicVariable "TIME_OF_DAY";
	publicVariable "CONTROLRATIO";
	publicVariable "CAPTURETIME";
	publicVariable "BLUFORFACTION";
	publicVariable "OPFORFACTION";
	publicVariable "ISWOODLAND";

	publicVariable "VILLAGEMARKERSIZE";
	publicVariable "CITYMARKERSIZE";
	publicVariable "CAPITALMARKERSIZE";
	publicVariable "OTHERMARKERSIZE";

	publicVariable "BLUFORSPAWNDIST";
	publicVariable "BLUFORSPAWNBAND";

	publicVariable "GAMESTARTED";
	publicVariable "GAMEENDED";
	publicVariable "OPFORTELEPORTED";
	publicVariable "BLUFORTELEPORTED";
	publicVariable "BLUFORINCONTROL";
	publicVariable "CITYCAPTURED";
	publicVariable "COMMANDVEHICLEDESTROYED";

	CAPTURETIMEREMAINING = CAPTURETIME;
	publicVariable "CAPTURETIMEREMAINING";

	//setup
	[] execVM "server\setup\setTime.sqf";
	[] execVM "server\setup\setWeather.sqf";
	[] execVM "server\setup\allLocationMarkers.sqf";
	[] execVM "server\setup\chosenCityListener.sqf";
	[] execVM "server\setup\chosenSpawnListener.sqf";
	[] execVM "server\setup\chooseCommandVehicle.sqf";
	[] execVM "server\setup\createCivilians.sqf";

	//main
	[] execVM "initWaveRespawn.sqf";
	[] execVM "server\endByControl.sqf";

	//TFAR
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
		[] execVM "tfarsettings.sqf";
	};
};

//PLAYERS ONLY =================================================================
if (hasInterface) then {

};
