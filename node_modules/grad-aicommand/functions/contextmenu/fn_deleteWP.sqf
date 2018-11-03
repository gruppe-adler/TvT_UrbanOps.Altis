#include "script_component.hpp"

params [["_mode","SINGLE"]];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
if (isNull _currentGroup) exitWith {};

switch (_mode) do {
    case ("SINGLE"): {
        private _currentWaypoint = _currentGroup getVariable [QGVAR(selectedWaypoint),[]];
        if (count _currentWaypoint == 0) exitWith {};

        deleteWaypoint _currentWaypoint;
    };

    case ("ALL"): {
        while {(count waypoints _currentGroup) > 0} do {
            deleteWaypoint ((waypoints _currentGroup) select 0);
        };
    };
};
