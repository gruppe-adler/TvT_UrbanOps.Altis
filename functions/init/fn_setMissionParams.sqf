if (!isServer) exitWith {};

//MUST SELECT ==================================================================
WEATHER_SETTING = "WeatherSetting" call BIS_fnc_getParamValue;
TIME_OF_DAY = "TimeOfDay" call BIS_fnc_getParamValue;
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
PRESET = [
  "CUSTOM",
  "DEBUG"
] select ("Preset" call BIS_fnc_getParamValue);

//ONLY USE USER SETTINGS IF PRESET IS CUSTOM
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
  SETUPTIME = 10;
  WAVERESPAWNTIME = 10;
  RESPAWNTIME = 10;
  OPFORRESPAWNENABLED = true;
};

publicVariable "WEATHER_SETTING";
publicVariable "TIME_OF_DAY";
publicVariable "BLUFORFACTION";
publicVariable "OPFORFACTION";
publicVariable "PRESET";

publicVariable "CONTROLRATIO";
publicVariable "CAPTURETIME";
publicVariable "DEFENSETIME";
publicVariable "SETUPTIME";
publicVariable "WAVERESPAWNTIME";
publicVariable "RESPAWNTIME";
publicVariable "OPFORRESPAWNENABLED";
