_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];
_currentWaypoints = (group _currentUnit) getVariable ["grad_aicommand_currentWaypoints",[]];
(group _currentUnit) setVariable ["grad_aicommand_currentWaypoints",_currentWaypoints,true];
[{(group _this) setVariable ["grad_aicommand_isBeingEdited",false,true];}, _currentUnit, 3] call CBA_fnc_waitAndExecute;


[] call grad_aicommand_fnc_removeAllEHs;
