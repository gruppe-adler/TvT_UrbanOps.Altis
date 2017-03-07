if (!isServer) exitWith {};

//FACTIONS =====================================================================
uo_missionParam_BLUFORFACTION = [
    "us_army",
    "rus_msv",
    "ind_eastern_nationalists",
    "ind_pmc_special",
    "ind_me_terrorists",
    "ger_heer"
] select ("BluforFaction" call BIS_fnc_getParamValue);
uo_missionParam_OPFORFACTION = [
    "us_army",
    "rus_msv",
    "ind_eastern_nationalists",
    "ind_pmc_special",
    "ind_me_terrorists",
    "ger_heer"
] select ("OpforFaction" call BIS_fnc_getParamValue);
uo_missionParam_ISWOODLAND = ["isWoodland"] call uo_common_fnc_getIslandCfgValue;

publicVariable "uo_missionParam_BLUFORFACTION";
publicVariable "uo_missionParam_OPFORFACTION";
publicVariable "uo_missionParam_ISWOODLAND";

["LOG", "SERVER_SETUP", "uo_missionParam_BLUFORFACTION"] call uo_common_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_OPFORFACTION"] call uo_common_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_ISWOODLAND"] call uo_common_fnc_diagReport;

//NON uo_missionParam_PRESET PARAMS ============================================================
uo_missionParam_WEATHERSETTING = "WeatherSetting" call BIS_fnc_getParamValue;
uo_missionParam_TIMEOFDAY = "TimeOfDay" call BIS_fnc_getParamValue;

publicVariable "uo_missionParam_WEATHERSETTING";
publicVariable "uo_missionParam_TIMEOFDAY";

//WAVE SIZE ====================================================================
[] call uo_waverespawn_fnc_setWaveSize;

publicVariable "BLUFORWAVESIZE";
publicVariable "OPFORWAVESIZE";

//GET uo_missionParam_PRESET ===================================================================
uo_missionParam_PRESET = [
    "CUSTOM",
    "DEBUG_SINGLE",
    "DEBUG_MULTI"
] select ("Preset" call BIS_fnc_getParamValue);

publicVariable "uo_missionParam_PRESET";

["LOG", "SERVER_SETUP", "uo_missionParam_PRESET"] call uo_common_fnc_diagReport;

//SET uo_missionParam_PRESET PARAMS ============================================================
switch (uo_missionParam_PRESET) do {
    case ("CUSTOM"): {
        uo_missionParam_CONTROLRATIO = "ControlRatio" call BIS_fnc_getParamValue;
        uo_missionParam_MONEYFACTOR = "MoneyFactor" call BIS_fnc_getParamValue;
        uo_missionParam_CAPTURETIME= "CaptureTime" call BIS_fnc_getParamValue;
        uo_missionParams_RANKEDMODE = ("RankedMode" call BIS_fnc_getParamValue) == 1;
        uo_missionParam_DEFENSETIME = "DefenseTime" call BIS_fnc_getParamValue;
        uo_missionParam_SETUPTIME = "SetupTime" call BIS_fnc_getParamValue;
        uo_missionParam_WAVERESPAWNTIMEBLU = "waverespawntimeblu" call BIS_fnc_getParamValue;
        uo_missionParam_WAVERESPAWNTIMEOPF = "waverespawntimeopf" call BIS_fnc_getParamValue;
        uo_missionParam_RESPAWNTIME = "respawntime" call BIS_fnc_getParamValue;
        uo_missionParam_OPFORRESPAWNENABLED = ("OpforRespawn" call BIS_fnc_getParamValue) == 1;
        uo_missionParam_BLUFORRESPAWNENABLED = ("BluforRespawn" call BIS_fnc_getParamValue) == 1;
    };

    case ("DEBUG_SINGLE"): {
        uo_missionParam_CONTROLRATIO = 2;
        uo_missionParam_MONEYFACTOR = 1;
        uo_missionParam_CAPTURETIME= 60;
        uo_missionParams_RANKEDMODE = false;
        uo_missionParam_DEFENSETIME = 3600;
        uo_missionParam_SETUPTIME = 5;
        uo_missionParam_WAVERESPAWNTIMEBLU = 10;
        uo_missionParam_WAVERESPAWNTIMEOPF = 10;
        uo_missionParam_RESPAWNTIME = 10;
        uo_missionParam_OPFORRESPAWNENABLED = true;
        uo_missionParam_BLUFORRESPAWNENABLED = true;
    };

    case ("DEBUG_MULTI"): {
        uo_missionParam_CONTROLRATIO = 1;
        uo_missionParam_MONEYFACTOR = 1;
        uo_missionParam_CAPTURETIME= 60;
        uo_missionParams_RANKEDMODE = false;
        uo_missionParam_DEFENSETIME = 3600;
        uo_missionParam_SETUPTIME = 30;
        uo_missionParam_WAVERESPAWNTIMEBLU = 10;
        uo_missionParam_WAVERESPAWNTIMEOPF = 10;
        uo_missionParam_RESPAWNTIME = 10;
        uo_missionParam_OPFORRESPAWNENABLED = true;
        uo_missionParam_BLUFORRESPAWNENABLED = true;
    };
};

publicVariable "uo_missionParam_CONTROLRATIO";
publicVariable "uo_missionParam_MONEYFACTOR";
publicVariable "uo_missionParam_CAPTURETIME";
publicVariable "uo_missionParams_RANKEDMODE";
publicVariable "uo_missionParam_DEFENSETIME";
publicVariable "uo_missionParam_SETUPTIME";
publicVariable "uo_missionParam_WAVERESPAWNTIMEBLU";
publicVariable "uo_missionParam_WAVERESPAWNTIMEOPF";
publicVariable "uo_missionParam_RESPAWNTIME";
publicVariable "uo_missionParam_OPFORRESPAWNENABLED";
publicVariable "uo_missionParam_BLUFORRESPAWNENABLED";

["LOG", "SERVER_SETUP", "uo_missionParam_CONTROLRATIO"] call uo_common_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_MONEYFACTOR"] call uo_common_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_CAPTURETIME"] call uo_common_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParams_RANKEDMODE"] call uo_common_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_DEFENSETIME"] call uo_common_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_SETUPTIME"] call uo_common_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_WAVERESPAWNTIMEBLU"] call uo_common_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_WAVERESPAWNTIMEOPF"] call uo_common_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_RESPAWNTIME"] call uo_common_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_OPFORRESPAWNENABLED"] call uo_common_fnc_diagReport;

//DONE =========================================================================
missionNamespace setVariable ["uo_init_missionParamsDone", true, true];
