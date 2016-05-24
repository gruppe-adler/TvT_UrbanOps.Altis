/*  Sets map start position
*
*   executed via initPlayerLocal on player
*/

private ["_configpos"];
waitUntil {!isNil "originalSide"};

if (originalSide == "WEST") then {
  _configpos = (ISLAND_CONFIG select (ISLANDS find worldName)) select 1;
} else {
  _configpos = (ISLAND_CONFIG select (ISLANDS find worldName)) select 2;
};

_pos = _configpos findEmptyPosition [0,10];
player allowDamage false;
player setPos _pos;

diag_log format ["mapStartPos.sqf - Moved player to startposition %1. Configposition was %2", _pos, _configpos];
