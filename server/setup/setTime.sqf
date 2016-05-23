/*  Sets time
*
*   executed via init.sqf on server
*/

//random
if (TIME_OF_DAY == 1000) then {
  _availableSettings = getArray (missionConfigFile >> "Params" >> "TimeOfDay" >> "values");
  _availableSettings = _availableSettings - [1000];
  TIME_OF_DAY = selectRandom _availableSettings;
};

diag_log format ["setTime.sqf - Setting time to %1:00", TIME_OF_DAY];
[[2015, 2, 5, TIME_OF_DAY, 0]] call bis_fnc_setDate;
