#define PREFIX uo
#define COMPONENT setup
#include "\x\cba\addons\main\script_macros_mission.hpp"


if (!hasInterface) exitWith {};

[{_originalSide = player getVariable "originalSide"; !isNil "_originalSide"}, {
    private ["_configpos"];
    if (player getVariable "originalSide" == "WEST") then {
        _configpos = ["spawnPosBlu"] call uo_common_fnc_getIslandCfgValue;
    } else {
        _configpos = ["spawnPosOpf"] call uo_common_fnc_getIslandCfgValue;
    };

    _pos = _configpos findEmptyPosition [0,10];
    if (str _pos == "[]") then {_pos = _configpos};
    player allowDamage false;
    player setPos _pos;
    INFO_2("Moved player to startposition %1. Configposition was %2", _pos, _configpos);
}, []] call CBA_fnc_waitUntilAndExecute;
