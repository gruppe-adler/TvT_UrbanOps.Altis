#include "script_component.hpp"

params [["_group",grpNull]];


side _group == side ACE_player &&
{count units _group > 0} &&
{!isPlayer leader _group} &&
{
    _leaderVar = (leader _group) getVariable QGVAR(canReceiveCommands);
    if (!isNil "_leaderVar") exitWith {_leaderVar};

    _groupVar = _group getVariable QGVAR(canReceiveCommands);
    if (!isNil "_groupVar") exitWith {_groupVar};

    GVAR(canReceiveCommandsDefault)
} &&
{
    (ACE_player getVariable [QGVAR(givePermissionLevel),0]) >=
    ((leader _group) getVariable [QGVAR(receivePermissionLevel),_group getVariable [QGVAR(receivePermissionLevel),0]])
}
