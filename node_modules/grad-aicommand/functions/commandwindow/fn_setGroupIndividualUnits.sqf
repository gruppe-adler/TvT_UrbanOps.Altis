#include "script_component.hpp"

params [["_group",missionNamespace getVariable [QGVAR(currentGroup),grpNull]],["_toggle",!((missionNamespace getVariable [QGVAR(currentGroup),grpNull]) in GVAR(individualUnitsGroups))]];

if (_toggle) then {
    GVAR(individualUnitsGroups) pushBackUnique _group;
} else {
    GVAR(individualUnitsGroups) deleteAt (GVAR(individualUnitsGroups) find _group);
};
