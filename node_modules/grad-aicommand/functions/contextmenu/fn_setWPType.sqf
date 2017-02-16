params ["_type"];

_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];
_currentWaypoints = (group _currentUnit) getVariable ["grad_aicommand_currentWaypoints",[]];
_wpIndex = missionNamespace getVariable ["grad_aicommand_selectedWaypoint",-1];
if (_wpIndex < 0) exitWith {};

_wp = _currentWaypoints select _wpIndex;

if (_type in ["MOVE","CYCLE","GETIN NEAREST","GETOUT"]) then {
    _wp set [3,_type];
};
