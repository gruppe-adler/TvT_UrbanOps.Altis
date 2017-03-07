#define PREFIX uo
#define COMPONENT missionstart
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_side"];

_deadPlayers = if (_side == WEST) then {deadPlayersBlu} else {deadPlayersOpf};
_deadPlayersGroup = createGroup _side;
_deadPlayers joinSilent _deadPlayersGroup;
_deadPlayers resize 0;
_numberOfGroups = ceil ((count units _deadPlayersGroup)/5);
INFO_2("Organizing dead %1 players into %2 groups.",_side,_numberOfGroups);

//create groups, add teamleads
_newGroups = [];
for [{_i=0}, {_i<_numberOfGroups}, {_i=_i+1}] do {
    _leader = [_deadPlayersGroup] call uo_waverespawn_fnc_getHighestRanking;    

    _group = createGroup _side;
    [_leader] joinSilent _group;
    _groupName = [_side] call uo_waverespawn_fnc_generateGroupName;
    _group setGroupIDGlobal [_groupName];

    [{!isNull (_this select 0)}, {
        params ["_group","_groupName"];
        _data   = [nil, _groupName, false]; // [<Insignia>, <Group Name>, <Private>]
        ["RegisterGroup", [_group, leader _group, _data]] call BIS_fnc_dynamicGroups;
    }, [_group,_groupName]] call CBA_fnc_waitUntilAndExecute;

    _newGroups pushBack _group;
    INFO_2("%1 selected as leader for %2.", name _leader, _groupName);
};

//get specialists
_allMGs = [];
_allATs = [];
_allMedics = [];
{
    _role = [_x] call uo_waverespawn_fnc_getRole;
    switch (_role) do {
        case ("MG"): {_allMGs pushBack _x};
        case ("AT"): {_allATs pushBack _x};
        case ("MEDIC"): {_allMedics pushBack _x};
    };
} forEach (units _deadPlayersGroup);

//distribute specialists
{
    {
        _unit = _x;
        [_unit] joinSilent ([_newGroups] call uo_waverespawn_fnc_getSmallestGroup);
    } forEach _x;
} forEach [_allMGs,_allATs,_allMedics];

//distribute riflemen
{
    [_x] joinSilent ([_newGroups] call uo_waverespawn_fnc_getSmallestGroup);
} forEach (units _deadPlayersGroup);

deleteGroup _deadPlayersGroup;

_newGroups
