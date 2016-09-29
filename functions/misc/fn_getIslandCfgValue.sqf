params ["_entry"];
_cfg = missionConfigFile >> "CfgIslands" >> worldName;
if (!isClass _cfg) exitWith {diag_log format ["fn_getIslandCfgValue - ERROR: CONFIG FOR ISLAND %1 NOT FOUND.", worldName]};

if (isNumber (_cfg >> _entry)) exitWith {getNumber (_cfg >> _entry)};
if (isArray (_cfg >> _entry)) exitWith {getArray (_cfg >> _entry)};
if (isText (_cfg >> _entry)) exitWith {
  _return = getText (_cfg >> _entry);
  if (_return == "true") then {
    _return = true
  } else {
    if (_return == "false") then {_return = false};
  };
  _return
};

diag_log format ["fn_getIslandCfgValue - ERROR: %1 NOT FOUND IN CONFIG FOR %2.", _entry, worldName];
-1;
