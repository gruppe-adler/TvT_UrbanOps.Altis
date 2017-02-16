_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];
_currentWaypoints = (group _currentUnit) getVariable ["grad_aicommand_currentWaypoints",[]];
(group _currentUnit) setVariable ["grad_aicommand_currentWaypoints",_currentWaypoints,true];

[] call grad_aicommand_fnc_removeAllEHs;
