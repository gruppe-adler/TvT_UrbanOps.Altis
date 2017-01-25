#define PREFIX uo
#define COMPONENT common
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_id","_uid","_name","_jip","_ownerID"];
if !(_jip) exitWith {};

INFO_1("Player %1 is JIP. Handling spawn position.",_name);

[{!isNull ([_this select 0] call BIS_fnc_getUnitByUID)}, {
    _unit = [_this select 0] call BIS_fnc_getUnitByUID;

    if (side _unit == WEST && missionNamespace getVariable ["uo_init_bluforSpawnSet", false]) then {
        _startPos = [getPos (uo_cv_allCVs select 0), [5,25]] call uo_common_fnc_findRandomPos;
        _unit setVariable ["startPosition", _startPos, true];
    };

    if (side _unit == EAST && missionNamespace getVariable ["uo_init_opforSpawnSet", false]) then {
        _startPos = [getPos uo_DEALER, [0,50]] call uo_common_fnc_findRandomPos;
		_unit setVariable ["startPosition", _startPos, true];
    };
}, [_uid]] call CBA_fnc_waitUntilAndExecute;
