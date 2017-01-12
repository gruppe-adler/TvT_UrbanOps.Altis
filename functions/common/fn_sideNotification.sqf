params ["_side", "_title", "_text"];

if (!hasInterface) exitWith {};
if (side player != _side) exitWith {};

["uo_notification",[_title,_text]] call bis_fnc_showNotification;
