if (!isServer) exitWith {};

//random
if (uo_missionParam_TIMEOFDAY == 1000) then {
    _availableSettings = getArray (missionConfigFile >> "Params" >> "TimeOfDay" >> "values");
    _availableSettings = _availableSettings - [1000];
    uo_missionParam_TIMEOFDAY = selectRandom _availableSettings;
};

["LOG", "SERVER_SETUP", format ["fn_setTime - Setting time to %1:00", uo_missionParam_TIMEOFDAY]] call uo_common_fnc_diagReport;
[[2015, 2, 5, uo_missionParam_TIMEOFDAY, 0]] call bis_fnc_setDate;
