params ["_unit","_pos"];

if (!local _unit) exitWith {};

_unit allowDamage false;
_unit setPos _pos;
[{_this allowDamage true}, _unit, 2] call CBA_fnc_waitAndExecute;

[] call uo_waverespawn_fnc_onPlayerRespawn;
