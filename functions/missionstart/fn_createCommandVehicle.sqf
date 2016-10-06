if (!isServer) exitWith {};

params ["_searchPos"];
_pos = _searchPos findEmptyPosition [0,150,COMMANDVEHICLECLASS];
if (str _pos == "[]") then {_pos = _searchPos};

//spawn vehicle
_cv = COMMANDVEHICLECLASS createVehicle _pos;
[{!isNull (_this select 0)}, {
  diag_log str _this;

  params ["_cv"];
  diag_log format ["fn_createCommandVehicle - Command vehicle %1 created.", _cv];
  missionNamespace setVariable ["uo_init_cvCreated", true, true];

  _cv setDir (_cv getDir CITYPOSITION);
  _cv setVariable ["uo_cv_isActive", false, true];

  _allCVs = missionNamespace getVariable ["uo_cv_allCVs", []];
  _id = _allCVs pushBack _cv;
  missionNamespace setVariable ["uo_cv_allCVs", _allCVs, true];

  [_cv] call mcd_fnc_emptyContainer;
  [_cv] call mcd_fnc_checkCommandVehicle;
  [_cv, _id+1] remoteExec ["mcd_fnc_commandVehicleMarker",0,true];

}, [_cv]] call CBA_fnc_waitUntilAndExecute;
