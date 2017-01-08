if (!isServer) exitWith {};

//FACTIONS =====================================================================
uo_missionParam_BLUFORFACTION = [
    "us_army",
    "ger_heer",
    "rus_msv",
    "ind_eastRebels",
    "ind_terrorists"
] select ("BluforFaction" call BIS_fnc_getParamValue);
uo_missionParam_OPFORFACTION = [
    "us_army",
    "ger_heer",
    "rus_msv",
    "ind_eastRebels",
    "ind_terrorists"
] select ("OpforFaction" call BIS_fnc_getParamValue);
uo_missionParam_ISWOODLAND = ["isWoodland"] call uo_fnc_getIslandCfgValue;

publicVariable "uo_missionParam_BLUFORFACTION";
publicVariable "uo_missionParam_OPFORFACTION";
publicVariable "uo_missionParam_ISWOODLAND";

["LOG", "SERVER_SETUP", "uo_missionParam_BLUFORFACTION"] call uo_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_OPFORFACTION"] call uo_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_ISWOODLAND"] call uo_fnc_diagReport;

//NON uo_missionParam_PRESET PARAMS ============================================================
uo_missionParam_WEATHERSETTING = "WeatherSetting" call BIS_fnc_getParamValue;
uo_missionParam_TIMEOFDAY = "TimeOfDay" call BIS_fnc_getParamValue;

publicVariable "uo_missionParam_WEATHERSETTING";
publicVariable "uo_missionParam_TIMEOFDAY";

//WAVE SIZE ====================================================================
[] call uo_fnc_setWaveSize;

publicVariable "BLUFORWAVESIZE";
publicVariable "OPFORWAVESIZE";

//GET uo_missionParam_PRESET ===================================================================
uo_missionParam_PRESET = [
    "CUSTOM",
    "DEBUG"
] select ("Preset" call BIS_fnc_getParamValue);

publicVariable "uo_missionParam_PRESET";

["LOG", "SERVER_SETUP", "uo_missionParam_PRESET"] call uo_fnc_diagReport;

//SET uo_missionParam_PRESET PARAMS ============================================================
if (uo_missionParam_PRESET == "CUSTOM") then {
    uo_missionParam_CONTROLRATIO = "ControlRatio" call BIS_fnc_getParamValue;
    uo_missionParam_MONEYFACTOR = "MoneyFactor" call BIS_fnc_getParamValue;
    uo_missionParam_CAPTURETIME= "CaptureTime" call BIS_fnc_getParamValue;
    uo_missionParam_DEFENSETIME = "DefenseTime" call BIS_fnc_getParamValue;
    uo_missionParam_SETUPTIME = "SetupTime" call BIS_fnc_getParamValue;
    uo_missionParam_WAVERESPAWNTIME = "waverespawntime" call BIS_fnc_getParamValue;
    uo_missionParam_RESPAWNTIME = "respawntime" call BIS_fnc_getParamValue;
    uo_missionParam_OPFORRESPAWNENABLED = ("OpforRespawn" call BIS_fnc_getParamValue) == 1;
};

if (uo_missionParam_PRESET == "DEBUG") then {
    uo_missionParam_CONTROLRATIO = 2;
    uo_missionParam_MONEYFACTOR = 1;
    uo_missionParam_CAPTURETIME= 60;
    uo_missionParam_DEFENSETIME = 900;
    uo_missionParam_SETUPTIME = 5;
    uo_missionParam_WAVERESPAWNTIME = 10;
    uo_missionParam_RESPAWNTIME = 10;
    uo_missionParam_OPFORRESPAWNENABLED = true;
};

publicVariable "uo_missionParam_CONTROLRATIO";
publicVariable "uo_missionParam_MONEYFACTOR";
publicVariable "uo_missionParam_CAPTURETIME";
publicVariable "uo_missionParam_DEFENSETIME";
publicVariable "uo_missionParam_SETUPTIME";
publicVariable "uo_missionParam_WAVERESPAWNTIME";
publicVariable "uo_missionParam_RESPAWNTIME";
publicVariable "uo_missionParam_OPFORRESPAWNENABLED";

["LOG", "SERVER_SETUP", "uo_missionParam_CONTROLRATIO"] call uo_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_MONEYFACTOR"] call uo_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_CAPTURETIME"] call uo_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_DEFENSETIME"] call uo_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_SETUPTIME"] call uo_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_WAVERESPAWNTIME"] call uo_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_RESPAWNTIME"] call uo_fnc_diagReport;
["LOG", "SERVER_SETUP", "uo_missionParam_OPFORRESPAWNENABLED"] call uo_fnc_diagReport;

//DONE =========================================================================
missionNamespace setVariable ["uo_init_missionParamsDone", true, true];
