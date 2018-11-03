#include "script_component.hpp"

params [["_unitID",-1]];

private _previousGroup = missionNamespace getVariable [QGVAR(currentGroup),grpNull];
private _unit = (units _previousGroup) param [_unitID,objNull];
if (isNull _unit) exitWith {};

private _canReceiveCommands = _previousGroup getVariable QGVAR(canReceiveCommands);
if (!isNil "_canReceiveCommands") then {_newGroup setVariable [QGVAR(canReceiveCommands),_canReceiveCommands,true]};

private _newGroup = createGroup [side _previousGroup,true];
[_unit] joinSilent _newGroup;

// if direct edit mode --> update editable groups with new group
if (GVAR(editMode) == 1) then {
    GVAR(editableGroups) pushBack _newGroup;
    _newGroup setVariable [QGVAR(isDirectEdit),true,true];
};

// if paused --> transfer to new group
if (_previousGroup getVariable [QGVAR(isPaused),false]) then {
    _newGroup setVariable [QGVAR(isPaused),true,true];
};

// if individual units were displayed in old group, do the same for new group
if (_previousGroup in (missionNamespace getVariable [QGVAR(individualUnitsGroups),[]])) then {
    GVAR(individualUnitsGroups) pushBack _newGroup;
};
