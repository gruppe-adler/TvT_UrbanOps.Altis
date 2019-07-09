#include "script_component.hpp"

params ["_parent","_mode"];

private _groupMenuGroup = missionNamespace getVariable [QGVAR(groupMenuGroup),grpNull];
GVAR(submenuJoinableGroups) = allGroups select {[_x] call FUNC(isEditableGroup) && _x != _groupMenuGroup};

private _entries = [];
{
    _entry = [groupID _x,format [QUOTE([%1] call FUNC(submenuJoinGroup); [false] call FUNC(openContextMenu);),_forEachIndex]];
    _entries pushBack _entry;
} forEach GVAR(submenuJoinableGroups);

[_parent,_mode,_entries] call FUNC(createSubMenu);
