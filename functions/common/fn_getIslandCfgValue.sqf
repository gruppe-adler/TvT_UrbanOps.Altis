#define PREFIX uo
#define COMPONENT common
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_entry"];
_cfg = missionConfigFile >> "CfgGradIslands" >> worldName;
if (!isClass _cfg) exitWith {ERROR_1("Config for island %1 not found.", worldName)};

if (isNumber (_cfg >> _entry)) exitWith {getNumber (_cfg >> _entry)};
if (isArray (_cfg >> _entry)) exitWith {getArray (_cfg >> _entry)};
if (isText (_cfg >> _entry)) exitWith {
    _return = getText (_cfg >> _entry);
    if ((toLower _return) in ["true","false"]) then {_return = call compile _return};
    _return
};

ERROR_2("%1 not found in config for %2.",_entry, worldName);
-1;
