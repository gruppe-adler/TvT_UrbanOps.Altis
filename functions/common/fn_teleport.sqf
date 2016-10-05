/*  Teleports unit
*
*   Params:
*   0:  unit
*   1:  destination
*/

_this spawn {
  params ["_unit", ["_pos", [0,0,0]]];

  _unit allowDamage false;
  _unit setPos _pos;
  sleep 1;
  _unit allowDamage true;
};
