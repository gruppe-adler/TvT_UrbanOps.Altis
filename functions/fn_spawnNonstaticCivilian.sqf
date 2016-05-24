/*  Spawns nonstatic civilian
*
*   Params:
*   0:  position
*/

params ["_pos"];
_group = createGroup civilian;
"C_man_1" createUnit [_pos,_group, "newUnit = this"];

waitUntil {!isNil "newUnit"};
waitUntil {!isNull newUnit};
_unit = newUnit;

_unit forceAddUniform (selectRandom civUniforms);
_unit addHeadgear (selectRandom civHeadgear);
_unit addGoggles (selectRandom civGoggles);

_wpPos = _pos vectorAdd [2,0,0];
_wp = _group addWaypoint [_wpPos,1];
_wp setWaypointType "DISMISS";
