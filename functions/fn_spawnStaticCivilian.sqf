/*  Spawns static civilian
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
_unit disableAI "MOVE";
_unit setDir (random 360);

_unit forceAddUniform (selectRandom civUniforms);
_unit addHeadgear (selectRandom civHeadgear);
_unit addGoggles (selectRandom civGoggles);
