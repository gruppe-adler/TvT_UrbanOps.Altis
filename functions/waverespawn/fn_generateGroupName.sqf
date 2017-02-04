params ["_side"];
private ["_groupName","_nameAvailable"];

_groupNames = [
    "Alpha",
    "Bravo",
    "Charlie",
    "Delta",
    "Echo",
    "Foxtrot",
    "Golf",
    "Hotel",
    "India",
    "Juliet",
    "Kilo",
    "Lima",
    "Mike",
    "November",
    "Oscar",
    "Papa",
    "Quebec",
    "Romeo",
    "Sierra",
    "Tango",
    "Uniform",
    "Victor",
    "Whiskey",
    "X-Ray",
    "Yankee",
    "Zulu"
];

for [{_i=0}, {_i<100}, {_i=_i+1}] do {
    {
        _groupName = if (_i == 0) then {_groupNames select _forEachIndex} else {format ["%1 %2",_groupNames select _forEachIndex, _i]};
        _nameAvailable = (["GetGroupByName", [_groupName, _side]] call BIS_fnc_dynamicGroups) isEqualTo grpNull;
        if (_nameAvailable) exitWith {};
    } forEach _groupNames;
    if (_nameAvailable) exitWith {};
};

_groupName
