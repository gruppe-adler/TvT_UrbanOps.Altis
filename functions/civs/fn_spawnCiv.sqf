/*    Spawns nonstatic civilian
*
*     Params:
*     0:    position
*/

params ["_pos",["_static",false]];
_group = createGroup civilian;
_unit = _group createUnit ["C_man_1",_pos,[],0,"NONE"];

[{!isNull (_this select 0)}, {
    params ["_unit","_static"];

    if (_static) then {
        _unit disableAI "PATH";
        _unit setDir (random 360);
    };

    _unit forceAddUniform (selectRandom uo_civUniforms);
    _unit addHeadgear (selectRandom uo_civHeadgear);
    _unit addGoggles (selectRandom uo_civGoggles);

    [group _unit, getPos _unit, 300, [2,5], [0,10,40]] call uo_fnc_taskPatrol;

    _ehID = _unit addEventHandler ["killed", {[_this] call uo_fnc_civKilled}];
    _unit setVariable ["uo_killedEH",_ehID];

    _allCivs = missionNamespace getVariable ["uo_cv_allCivs", []];
    _allCivs pushBack _unit;
    missionNamespace setVariable ["uo_cv_allCivs", _allCivs, true];
}, [_unit,_static]] call CBA_fnc_waitUntilAndExecute;

_unit
