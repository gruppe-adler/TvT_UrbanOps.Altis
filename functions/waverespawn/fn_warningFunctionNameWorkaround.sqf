/*
 * Avoid .rpt spam by deleting old unit when new unit spawns.
 *
 * Example:
 * 18:49:54 WARNING: Function 'name' - opforcommander has no unit
 * 18:49:54  - network id 2:15
 * 18:49:54  - person McDiod
 * 18:49:54  - dead
 *
 */

#include "script_component.hpp"

params [["_newUnit",objNull],["_oldUnit",objNull]];

if (isNull _oldUnit) exitWith {};

private _assignedCuratorLogic = getAssignedCuratorLogic _oldUnit;
private _oldUnitPosASL = getPosASL _oldUnit;
private _oldUnitLoadout = getUnitLoadout _oldUnit;

private _replacementCorpse = "C_man_1" createVehicle [0,0,0];
[{!isNull (_this select 0)},{
    (_this select 0) setUnitLoadout (_this select 2);
    (_this select 0) setDamage 1;
    [{
        params ["_replacementCorpse","_oldUnitPosASL","_oldUnitLoadout","_oldUnit","_assignedCuratorLogic"];

        _replacementCorpse setPosASL _oldUnitPosASL;
        deleteVehicle _oldUnit;
        if (!isNull _assignedCuratorLogic) then {
            [player,_assignedCuratorLogic] remoteExecCall ["assignCurator",2,false];
        };

    },_this,1] call CBA_fnc_waitAndExecute;
},[_replacementCorpse,_oldUnitPosASL,_oldUnitLoadout,_oldUnit,_assignedCuratorLogic]] call CBA_fnc_waitUntilAndExecute;
