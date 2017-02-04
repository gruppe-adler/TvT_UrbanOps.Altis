params ["_groups"];

_smallestGroup = grpNull;
_smallestMembers = 99999;
{
    if (count units _x < _smallestMembers) then {
        _smallestGroup = _x
    };
} forEach _groups;

_smallestGroup
