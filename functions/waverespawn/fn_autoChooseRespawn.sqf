params ["_group"];

if (isNull _group) exitWith {};
if (count units _group < 1) exitWith {};
if (_group getVariable ["uo_waverespawn_groupIsRespawned",false]) exitWith {};

if (side _group == WEST) then {
    [{{_x getVariable ["uo_respawnObject_isActive", false]} count uo_cv_allCVs > 0 || count uo_cv_allCVs == 0}, {
        if (count uo_cv_allCVs == 0) exitWith {};
        _cv = (uo_cv_allCVs select {_x getVariable ["uo_respawnObject_isActive", false]}) select 0;
        [_this,getPos _cv] call uo_waverespawn_fnc_respawnGroup;
    }, _group] call CBA_fnc_waitUntilAndExecute;
} else {
    _pos = [CITYPOSITION, [0,CITYAREASIZE]] call uo_common_fnc_findRandomPos;
    [_group,_pos] call uo_waverespawn_fnc_respawnGroup;
};
