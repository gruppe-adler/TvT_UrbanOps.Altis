params [["_mode","SINGLE"]];

_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];
_currentWaypoints = (group _currentUnit) getVariable ["grad_aicommand_currentWaypoints",[]];

switch (_mode) do {
    case ("SINGLE"): {
        _wpIndex = missionNamespace getVariable ["grad_aicommand_selectedWaypoint",-1];
        if (_wpIndex < 0) exitWith {};
        _currentWaypoints deleteAt _wpIndex;
    };

    case ("ALL"): {
        while {count _currentWaypoints > 1} do {
            _currentWaypoints deleteAt 1;
        };
        _currentWaypoints set [0,[getPos _currentUnit,"UNCHANGED",[0,0,0],"MOVE",["true",""]]];
    };
};
