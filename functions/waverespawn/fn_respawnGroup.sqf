params ["_group","_pos"];

if !(player in (units _group)) exitWith {};

[{
    params ["_pos"];
    _respawnPos = _pos findEmptyPosition [3,50];
    if (count _respawnPos == 0) then {_respawnPos = _pos};
    [player,_respawnPos] call uo_common_fnc_teleport;
    [] call uo_waverespawn_fnc_onPlayerRespawn;
}, [_pos], random 2] call CBA_fnc_waitAndExecute;
