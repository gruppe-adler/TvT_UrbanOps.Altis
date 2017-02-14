params ["_unit","_pos"];

if (!local _unit) exitWith {};

["mcd_chooseRespawn", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
(findDisplay 46) displayRemoveEventHandler ["KeyUp", missionNamespace getVariable ["mcd_onRespawnKeyDown",-1]];
[false] call uo_ui_fnc_twoLineHint;
openMap [false, false];
[false] call uo_sectors_fnc_drawSectors;

_unit allowDamage false;
_unit setPos _pos;
[{_this allowDamage true}, _unit, 2] call CBA_fnc_waitAndExecute;

[] call uo_waverespawn_fnc_onPlayerRespawn;
