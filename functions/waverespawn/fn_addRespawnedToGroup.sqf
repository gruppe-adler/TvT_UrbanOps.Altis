/*    Adds a respawned player to a new group
*
*     Params:
*     0:    respawned player (object)
*     1:    originalSide (string)
*
*     executed by fnc_handleRespawned
*/

#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_player", "_side"];
private ["_leader", "_groupName"];

if (!isServer) exitWith {};

_allGroupNames = [
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

//check player side
if (_side == "UNKNOWN") exitWith {INFO_1("Player %1's side is unknown.", _player)};
if (_side == "WEST") then {
    newBluSpawns pushBack _player;
    _leader = newBluSpawns select 0;
};
if (_side == "EAST") then {
    newOpfSpawns pushBack _player;
    _leader = newOpfSpawns select 0;
};

//player is not leader --> join leader
if (_player != _leader) then {
    [_player] joinSilent _leader;
    INFO_2("Player %1 joined %2's group.", _player, _leader);
};

//player is leader --> register group
if (_player == _leader) then {
    _groupExists = true;
    _groupName = "";
    for [{_i=0}, {_i<(count _allGroupNames)}, {_i=_i+1}] do {
        _groupName = _allGroupNames select _i;
        _groupExists = str (["GetGroupByName", [_groupName, side _leader]] call BIS_fnc_dynamicGroups) != "<NULL-group>";
        if (!_groupExists) exitWith {};
    };
    _i = 0;
    while {_groupExists} do {
        _groupName = format ["%1 %2", _groupName, _i];
        _groupExists = str (["GetGroupByName", [_groupName, side _leader]] call BIS_fnc_dynamicGroups) != "<NULL-group>";
        _i = _i + 1;
    };

    ["RegisterGroup", [group _leader, _leader, [nil, _groupName, false]]] call BIS_fnc_dynamicGroups;
    INFO_2("Player %1 is groupleader of new respawned players for side %2.", _player, _side);
};
