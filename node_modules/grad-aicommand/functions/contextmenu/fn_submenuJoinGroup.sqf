#include "script_component.hpp"

params [["_groupID",-1]];

private _joinableGroups = missionNamespace getVariable [QGVAR(submenuJoinableGroups),[]];
private _groupToJoin = _joinableGroups param [_groupID,grpNull];

if (isNull _groupToJoin) exitWith {};

units (missionNamespace getVariable [QGVAR(currentGroup),grpNull]) joinSilent _groupToJoin;
