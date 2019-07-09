#include "script_component.hpp"

params [["_group",grpNull]];

if (isNull _group) exitWith {};

private _veh = vehicle leader _group;
[_group,_veh] remoteExec ["leaveVehicle",leader _group,false];
