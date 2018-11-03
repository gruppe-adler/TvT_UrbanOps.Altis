#include "script_component.hpp"

params ["_parent","_mode"];

private _currentGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];

private _entries = [];
{
    _unitName = name _x;
    if (count _unitName > 20) then {_unitName = format ["%1%2",_unitName select [0,17],"..."]};
    _unitDescription = format ["%1 (%2)",_unitName,[_x] call FUNC(getUnitRoleAbbreviation)];

    _entry = [_unitDescription,format [QUOTE([%1] call FUNC(submenuKickUnit); [false] call FUNC(openContextMenu);),_forEachIndex]];
    _entries pushBack _entry;
} forEach ((units _currentGroup) select {alive _x});

[_parent,_mode,_entries] call FUNC(createSubMenu);
