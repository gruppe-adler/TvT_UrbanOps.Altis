if (!isServer) exitWith {};

//random
if (uo_missionParam_TIMEOFDAY == 1000) then {
    _availableSettings = getArray (missionConfigFile >> "Params" >> "TimeOfDay" >> "values");
    _availableSettings = _availableSettings - [1000];
    uo_missionParam_TIMEOFDAY = selectRandom _availableSettings;
};

_hour = if (uo_missionParam_TIMEOFDAY > 0) then {uo_missionParam_TIMEOFDAY - 1} else {23};
_minute = 60 - uo_missionParam_SETUPTIME;
["LOG", "SERVER_SETUP", format ["fn_setTime - Setting time to %1:%1", _hour,_minute]] call uo_common_fnc_diagReport;
[[2015, 2, 5, _hour, _minute]] call bis_fnc_setDate;
