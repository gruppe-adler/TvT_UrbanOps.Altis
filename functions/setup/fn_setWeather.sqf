private ["_overcast"];

if (!isServer) exitWith {};

//OVERCAST =====================================================================
//random
if (WEATHER_SETTING == -1) then {
    _availableSettings = getArray (missionConfigFile >> "Params" >> "WeatherSetting" >> "values");
    _availableSettings = _availableSettings - [-1];
    _overcast = selectRandom _availableSettings;

//fixed
} else {
    _overcast = WEATHER_SETTING;
};

["LOG", "SERVER_SETUP", format ["fn_setWeather - Set overcast to %1.", _overcast]] call mcd_fnc_diagReport;
[_overcast * 0.01] call bis_fnc_setOvercast;

//FOG ==========================================================================
_mid = 0.03;

//extra chance of fog when its raining
if (_overcast >= 75) then {
    _mid = _mid + 0.08;
};

//extra chance of fog in the morning
if (TIME_OF_DAY <= 8) then {
    _mid = _mid + 0.12;
};

_fog = random [0,_mid,0.4];

["LOG", "SERVER_SETUP", format ["fn_setWeather - Set fog to %1.", _fog]] call mcd_fnc_diagReport;
0 setFog _fog;
