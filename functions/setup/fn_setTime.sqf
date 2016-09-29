if (!isServer) exitWith {};

//random
if (TIME_OF_DAY == 1000) then {
  _availableSettings = getArray (missionConfigFile >> "Params" >> "TimeOfDay" >> "values");
  _availableSettings = _availableSettings - [1000];
  TIME_OF_DAY = selectRandom _availableSettings;
};

["LOG", "SERVER_SETUP", format ["fn_setTime - Setting time to %1:00", TIME_OF_DAY]] call mcd_fnc_diagReport;
[[2015, 2, 5, TIME_OF_DAY, 0]] call bis_fnc_setDate;
