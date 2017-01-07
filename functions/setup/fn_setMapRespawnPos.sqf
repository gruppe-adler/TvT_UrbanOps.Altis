if (!isServer) exitWith {};

private ["_configpos"];

_bluforpos = ["spawnPosBlu"] call uo_fnc_getIslandCfgValue;
_opforpos = ["spawnPosOpf"] call uo_fnc_getIslandCfgValue;

_bluforpos = _bluforpos findEmptyPosition [0,20];
_opforpos = _opforpos findEmptyPosition [0,20];

"respawn_west" setMarkerPos _bluforpos;
"respawn_east" setMarkerPos _opforpos;

["LOG", "SERVER_SETUP", format ["fn_setMapRespawnPos - Moved Blufor respawn to %1, Opfor respawn to %2", _bluforpos, _opforpos]] call uo_fnc_diagReport;
