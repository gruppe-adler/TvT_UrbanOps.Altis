if (!isServer) exitWith {};

//FACTIONS =====================================================================
BLUFORFACTION = [
    "us_army",
    "ger_heer",
    "rus_msv",
    "ind_eastRebels",
    "ind_terrorists"
] select ("BluforFaction" call BIS_fnc_getParamValue);
OPFORFACTION = [
    "us_army",
    "ger_heer",
    "rus_msv",
    "ind_eastRebels",
    "ind_terrorists"
] select ("OpforFaction" call BIS_fnc_getParamValue);
UO_ISWOODLAND = ["isWoodland"] call mcd_fnc_getIslandCfgValue;

publicVariable "BLUFORFACTION";
publicVariable "OPFORFACTION";
publicVariable "UO_ISWOODLAND";

["LOG", "SERVER_SETUP", "BLUFORFACTION"] call mcd_fnc_diagReport;
["LOG", "SERVER_SETUP", "OPFORFACTION"] call mcd_fnc_diagReport;
["LOG", "SERVER_SETUP", "UO_ISWOODLAND"] call mcd_fnc_diagReport;

//NON PRESET PARAMS ============================================================
WEATHER_SETTING = "WeatherSetting" call BIS_fnc_getParamValue;
TIME_OF_DAY = "TimeOfDay" call BIS_fnc_getParamValue;

publicVariable "WEATHER_SETTING";
publicVariable "TIME_OF_DAY";

//WAVE SIZE ====================================================================
[] call mcd_fnc_setWaveSize;

publicVariable "BLUFORWAVESIZE";
publicVariable "OPFORWAVESIZE";

//GET PRESET ===================================================================
PRESET = [
    "CUSTOM",
    "DEBUG"
] select ("Preset" call BIS_fnc_getParamValue);

publicVariable "PRESET";

["LOG", "SERVER_SETUP", "PRESET"] call mcd_fnc_diagReport;

//SET PRESET PARAMS ============================================================
if (PRESET == "CUSTOM") then {
    CONTROLRATIO = "ControlRatio" call BIS_fnc_getParamValue;
    CAPTURETIME = "CaptureTime" call BIS_fnc_getParamValue;
    DEFENSETIME = "DefenseTime" call BIS_fnc_getParamValue;
    SETUPTIME = "SetupTime" call BIS_fnc_getParamValue;
    WAVERESPAWNTIME = "waverespawntime" call BIS_fnc_getParamValue;
    RESPAWNTIME = "respawntime" call BIS_fnc_getParamValue;
    OPFORRESPAWNENABLED = ("OpforRespawn" call BIS_fnc_getParamValue) == 1;
};

if (PRESET == "DEBUG") then {
    CONTROLRATIO = 2;
    CAPTURETIME = 60;
    DEFENSETIME = 900;
    SETUPTIME = 5;
    WAVERESPAWNTIME = 10;
    RESPAWNTIME = 10;
    OPFORRESPAWNENABLED = true;
};

publicVariable "CONTROLRATIO";
publicVariable "CAPTURETIME";
publicVariable "DEFENSETIME";
publicVariable "SETUPTIME";
publicVariable "WAVERESPAWNTIME";
publicVariable "RESPAWNTIME";
publicVariable "OPFORRESPAWNENABLED";

["LOG", "SERVER_SETUP", "CONTROLRATIO"] call mcd_fnc_diagReport;
["LOG", "SERVER_SETUP", "CAPTURETIME"] call mcd_fnc_diagReport;
["LOG", "SERVER_SETUP", "DEFENSETIME"] call mcd_fnc_diagReport;
["LOG", "SERVER_SETUP", "SETUPTIME"] call mcd_fnc_diagReport;
["LOG", "SERVER_SETUP", "WAVERESPAWNTIME"] call mcd_fnc_diagReport;
["LOG", "SERVER_SETUP", "RESPAWNTIME"] call mcd_fnc_diagReport;
["LOG", "SERVER_SETUP", "OPFORRESPAWNENABLED"] call mcd_fnc_diagReport;

//DONE =========================================================================
missionNamespace setVariable ["uo_init_missionParamsDone", true, true];
