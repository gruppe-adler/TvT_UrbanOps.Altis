//DEBUGDEBUGDEBUGDEBUGDEBUGDEBUG
CHOSENLOCATION = nearestLocation [[13991.4,18699.7,0], "NameCity"];
CITYCHOSEN = true;


if (isServer) then {

	//Misc =======================================================================
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
		[] execVM "tfarsettings.sqf";
	};
	call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
	call compile preprocessFile "islandConfig.sqf";

	//Functions ==================================================================
	mcd_fnc_emptyContainer = compile preprocessFileLineNumbers "functions\fn_emptyContainer.sqf";
	mcd_fnc_spawnStaticCivilian = compile preprocessFileLineNumbers "functions\fn_spawnStaticCivilian.sqf";
	mcd_fnc_spawnNonstaticCivilian = compile preprocessFileLineNumbers "functions\fn_spawnNonstaticCivilian.sqf";
	mcd_fnc_getKillerSide = compile preprocessFileLineNumbers "functions\fn_getKillerSide.sqf";
	mcd_fnc_bmBuyServer = compile preprocessFileLineNumbers "server\buymenu\fn_bmBuyServer.sqf";

	//Dynamic Groups =============================================================
	["Initialize", [true]] call BIS_fnc_dynamicGroups;

	//Parameters =================================================================
	call compile preprocessFileLineNumbers "server\setup\setMissionParameters.sqf";

	//Settings ===================================================================
	VILLAGEMARKERSIZE = 200;
	CITYMARKERSIZE = 300;
	CAPITALMARKERSIZE = 400;
	OTHERMARKERSIZE = 200;

	BLUFORSPAWNDIST = 1200;
	BLUFORSPAWNBAND = 1000;
	OPFORRESPAWNDIST = 100;

	CIVILIANPROBABILITY = 5;
	DEALERRADIUSFACTOR = 0.75;																										//CITYAREASIZE * DEALERRADIUSFACTOR == DEALERSPAWNRADIUS

	CAPTURETIMEREMAINING = CAPTURETIME;
	ISWOODLAND = (ISLAND_CONFIG select (ISLANDS find worldName)) select 0;


	publicVariable "VILLAGEMARKERSIZE";
	publicVariable "CITYMARKERSIZE";
	publicVariable "CAPITALMARKERSIZE";
	publicVariable "OTHERMARKERSIZE";

	publicVariable "BLUFORSPAWNDIST";
	publicVariable "BLUFORSPAWNBAND";
	publicVariable "OPFORRESPAWNDIST";

	publicVariable "CIVILIANPROBABILITY";
	publicVariable "DEALERRADIUSFACTOR";

	publicVariable "CAPTURETIMEREMAINING";
	publicVariable "ISWOODLAND";

	//Setup ======================================================================
	call compile preprocessFileLineNumbers "server\setup\publicVariables.sqf";
	[] execVM "server\setup\setTime.sqf";
	[] execVM "server\setup\setWeather.sqf";
	[] execVM "server\setup\mapRespawnPos.sqf";
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
};
