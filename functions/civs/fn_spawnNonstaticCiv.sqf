/*    Spawns nonstatic civilian
*
*     Params:
*     0:    position
*/

params ["_pos"];
_group = createGroup civilian;
_unit = _group createUnit ["C_man_1",_pos,[],0,"NONE"];

[{!isNull (_this select 0)}, {
    params ["_unit"];

    _unit forceAddUniform (selectRandom uo_civUniforms);
    _unit addHeadgear (selectRandom uo_civHeadgear);
    _unit addGoggles (selectRandom uo_civGoggles);

    [group _unit, getPos _unit, 300, [2,5], [0,10,40]] call uo_fnc_taskPatrol;

    _ehID = _unit addEventHandler ["killed", {[_this] call uo_fnc_civKilled}];
    _unit setVariable ["uo_killedEH",_ehID];
}, [_unit]] call CBA_fnc_waitUntilAndExecute;

_unit
