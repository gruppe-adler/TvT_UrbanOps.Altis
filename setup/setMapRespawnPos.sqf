/*  Sets map respawn position
*
*   executed via init.sqf on server
*/

private ["_configpos"];

_bluforpos = (ISLAND_CONFIG select (ISLANDS find worldName)) select 1;
_opforpos = (ISLAND_CONFIG select (ISLANDS find worldName)) select 2;

_bluforpos = _bluforpos findEmptyPosition [0,20];
_opforpos = _opforpos findEmptyPosition [0,20];

"respawn_west" setMarkerPos _bluforpos;
"respawn_east" setMarkerPos _opforpos;

["LOG", "SERVER SETUP", format ["mapRespawnPos.sqf - Moved Blufor respawn to %1, Opfor respawn to %2", _bluforpos, _opforpos]] call mcd_fnc_diagReport;
