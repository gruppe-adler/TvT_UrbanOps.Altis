/*    Spawns nonstatic civilian
*
*     Params:
*     0:    position
*/

params ["_pos",["_static",false]];
_group = createGroup civilian;
_type = selectRandom uo_civs_Units;
_unit = _group createUnit [_type,_pos,[],0,"NONE"];

[{!isNull (_this select 0)}, {
    params ["_unit","_static"];

    if (_static) then {
        _unit disableAI "PATH";
        _unit setDir (random 360);
    };

    _unit forceAddUniform (selectRandom uo_civs_uniforms);
    if (10 max (2 * count uo_civs_headgear) > random 100) then {_unit addHeadgear (selectRandom uo_civs_headgear)};
    if (10 max (2 * count uo_civs_goggles) > random 100) then {_unit addGoggles (selectRandom uo_civs_goggles)};

    [group _unit, getPos _unit, 300, [2,5], [0,10,40]] call uo_civs_fnc_taskPatrol;

    _ehID = _unit addEventHandler ["killed", {[_this] call uo_civs_fnc_onKilled}];
    _unit setVariable ["uo_killedEH",_ehID];

    _allCivs = missionNamespace getVariable ["uo_civs_allCivs", []];
    _allCivs pushBack _unit;
    missionNamespace setVariable ["uo_civs_allCivs", _allCivs, true];

    [_unit] call uo_civs_fnc_deleteIfDamaged;
}, [_unit,_static]] call CBA_fnc_waitUntilAndExecute;

_unit
