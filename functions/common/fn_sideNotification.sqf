params ["_side", "_title", "_text", ["_condition",{true}]];

if (!hasInterface) exitWith {};
if (typeName _side != "ARRAY") then {_side = [_side]};
if !(side player in _side) exitWith {};
if !(call _condition) exitWith {};

["uo_notification",[_title,_text]] call bis_fnc_showNotification;
