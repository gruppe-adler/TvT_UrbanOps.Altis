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

    /*_wpPos = _pos vectorAdd [2,0,0];
    _wp = _group addWaypoint [_wpPos,1];
    _wp setWaypointType "DISMISS";*/

    [group _unit, getPos _unit, 300] call bis_fnc_taskPatrol;

    _unit addEventHandler ["killed", {[_this] call mcd_fnc_civKilled}];
}, [_unit]] call CBA_fnc_waitUntilAndExecute;
