/*    Teleports unit
*
*     Params:
*     0:    unit
*     1:    destination
*/

params ["_unit",["_pos", [0,0,0]]];

if (!local _unit) exitWith {};

_unit allowDamage false;
_unit setPos _pos;
[{_this allowDamage true}, _unit, 2] call CBA_fnc_waitAndExecute;
