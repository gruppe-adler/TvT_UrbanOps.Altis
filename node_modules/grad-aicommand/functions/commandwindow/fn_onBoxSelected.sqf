#include "script_component.hpp"

params ["_selectedArea"];

GVAR(currentGroups) = GVAR(editableGroups) select {(leader _x) inArea _selectedArea};
GVAR(currentGroups) call GVAR(onGroupSelected);
