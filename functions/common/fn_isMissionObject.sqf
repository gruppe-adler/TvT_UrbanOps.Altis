params ["_object"];

if (isNull _object) exitWith {false};
_id = (netId _object) splitString ":";
_isMissionObject = (call compile (_id select 1)) > 0;
_isMissionObject
