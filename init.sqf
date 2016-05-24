/*//DEBUGDEBUGDEBUGDEBUGDEBUGDEBUG
CHOSENLOCATION = nearestLocation [[13991.4,18699.7,0], "NameCity"];
CITYCHOSEN = true;*/

call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
call compile preprocessFile "islandConfig.sqf";

//SERVER ONLY ==================================================================
if (isServer) then {

	mcd_fnc_createSideMarker = compile preprocessFileLineNumbers "functions\fn_createSideMarker.sqf";
	mcd_fnc_deleteSideMarker = compile preprocessFileLineNumbers "functions\fn_deleteSideMarker.sqf";
	mcd_fnc_emptyContainer = compile preprocessFileLineNumbers "functions\fn_emptyContainer.sqf";
	mcd_fnc_spawnStaticCivilian = compile preprocessFileLineNumbers "functions\fn_spawnStaticCivilian.sqf";
	mcd_fnc_spawnNonstaticCivilian = compile preprocessFileLineNumbers "functions\fn_spawnNonstaticCivilian.sqf";

	//Dynamic Groups
	["Initialize", [true]] call BIS_fnc_dynamicGroups;

	//Parameters
	WEATHER_SETTING = "WeatherSetting" call BIS_fnc_getParamValue;
	TIME_OF_DAY = "TimeOfDay" call BIS_fnc_getParamValue;
	CONTROLRATIO = "ControlRatio" call BIS_fnc_getParamValue;
	CAPTURETIME = "CaptureTime" call BIS_fnc_getParamValue;
	DEFENSETIME = "DefenseTime" call BIS_fnc_getParamValue;
	SETUPTIME = "SetupTime" call BIS_fnc_getParamValue;
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
	OPFORRESPAWNDIST = 100;

	CIVILIANPROBABILITY = 5;
	DEALERRADIUSFACTOR = 0.75;																										//CITYAREASIZE * DEALERRADIUSFACTOR == DEALERSPAWNRADIUS

	OPFORTELEPORTED = false;
	BLUFORTELEPORTED = false;

	GAMESTARTED = false;
	GAMEENDED = false;
	BLUFORINCONTROL = false;
	BLUFORELIMINATED = false;
	OPFORELIMINATED = false;
	CITYCAPTURED = false;
	CITYDEFENDED = false;
	CAPTURETIMEREMAINING = CAPTURETIME;

	COMMANDVEHICLEDESTROYED = false;
	DEALERKILLED = false;

	publicVariable "WEATHER_SETTING";
	publicVariable "TIME_OF_DAY";
	publicVariable "CONTROLRATIO";
	publicVariable "CAPTURETIME";
	publicVariable "DEFENSETIME";
	publicVariable "SETUPTIME";
	publicVariable "BLUFORFACTION";
	publicVariable "OPFORFACTION";
	publicVariable "ISWOODLAND";

	publicVariable "VILLAGEMARKERSIZE";
	publicVariable "CITYMARKERSIZE";
	publicVariable "CAPITALMARKERSIZE";
	publicVariable "OTHERMARKERSIZE";

	publicVariable "BLUFORSPAWNDIST";
	publicVariable "BLUFORSPAWNBAND";
	publicVariable "OPFORRESPAWNDIST";

	publicVariable "CIVILIANPROBABILITY";
	publicVariable "DEALERRADIUSFACTOR";

	publicVariable "OPFORTELEPORTED";
	publicVariable "BLUFORTELEPORTED";

	publicVariable "GAMESTARTED";
	publicVariable "GAMEENDED";
	publicVariable "BLUFORINCONTROL";
	publicVariable "BLUFORELIMINATED";
	publicVariable "OPFORELIMINATED";
	publicVariable "CITYCAPTURED";
	publicVariable "CITYDEFENDED";
	publicVariable "CAPTURETIMEREMAINING";

	publicVariable "COMMANDVEHICLEDESTROYED";
	publicVariable "DEALERKILLED";


	//setup
	[] execVM "server\setup\setTime.sqf";
	[] execVM "server\setup\setWeather.sqf";
	[] execVM "server\setup\allLocationMarkers.sqf";
	[] execVM "server\setup\chosenCityListener.sqf";
	[] execVM "server\setup\chosenSpawnListener.sqf";
	[] execVM "server\setup\chooseCommandVehicle.sqf";
	[] execVM "server\setup\createCivilians.sqf";
	[] execVM "server\setup\setupCountdown.sqf";

	//main
	[] execVM "initWaveRespawn.sqf";
	[] execVM "server\endByControl.sqf";
	[] execVM "server\endByTimeout.sqf";
	[] execVM "server\endByBluKilled.sqf";
	[] execVM "server\endByOpfKilled.sqf";

	//TFAR
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
		[] execVM "tfarsettings.sqf";
	};
};
