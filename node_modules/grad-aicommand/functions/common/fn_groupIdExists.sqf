#include "script_component.hpp"

params [["_groupID",""],["_side",sideUnknown]];

private _groupExists = false;

if (_groupID == "") exitWith {_groupExists};

{
    if (groupID _x == _groupID) exitWith {_groupExists = true};
} forEach allGroups select {side _x == _side};

_groupExists
