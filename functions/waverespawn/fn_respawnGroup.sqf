#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_group","_pos"];

_group setVariable ["uo_waverespawn_groupIsRespawned",true,true];

if (side _group == WEST) then {
    {
        [{
            params ["_unit","_pos"];
            _respawnPos = _pos findEmptyPosition [3,40];
            if (count _respawnPos == 0) then {_respawnPos = _pos};
            [_unit,_respawnPos] remoteExec ["uo_waverespawn_fnc_doRespawn",0,false];
        }, [_x,_pos], random 2] call CBA_fnc_waitAndExecute;
    } forEach (units _group);
};

if (side _group == EAST) then {
    _pos = [_pos] call uo_waverespawn_fnc_findOpfRespawnPos;

    //spawn in city
    if (uo_missionParam_OPFORRESPAWNMODE == 1) then {
        _building = [_pos,count (units _group)] call uo_waverespawn_fnc_findBuilding;
        if (!isNull _building) then {
            INFO_2("Respawning %1 group %2 in nearby building.",side _group,groupID _group);
            _buildingPositions = [_building] call uo_common_fnc_findBuildingPositions;
            {
                [{
                    params ["_unit","_pos"];
                    [_unit,_pos] remoteExec ["uo_waverespawn_fnc_doRespawn",0,false];
                }, [_x,_buildingPositions select _forEachIndex], random 2] call CBA_fnc_waitAndExecute;
            } forEach (units _group);
        } else {
            INFO_2("No building found for %1 group %2.",side _group,groupID _group);
            {
                [{
                    params ["_unit","_pos"];
                    _respawnPos = _pos findEmptyPosition [0,30];
                    if (count _respawnPos == 0) then {_respawnPos = _pos};
                    [_unit,_respawnPos] remoteExec ["uo_waverespawn_fnc_doRespawn",0,false];
                }, [_x,_pos], random 2] call CBA_fnc_waitAndExecute;
            } forEach (units _group);
        };

    //spawn outside city
    } else {
        diag_log ["SEARCHPOS",_pos];
        _roads = _pos nearRoads 400;
        if (count _roads > 0) then {
            _pos = getPos (selectRandom _roads);
            diag_log ["ROADPOS",_pos];
        } else {
            _vehicleClass = [uo_missionParam_OPFORFACTION] call uo_missionObjectives_fnc_getCommandVehicleClass;
            _pos = [_pos,[0,200],[0,360],_vehicleClass] call uo_common_fnc_findRandomPos;
            diag_log ["RANDOMPOS",_pos];
        };

        INFO_2("Random respawn outside playzone for %1 group %2 at %3.",side _group,groupID _group,_pos);
        {
            [{
                params ["_unit","_pos"];
                _respawnPos = _pos findEmptyPosition [0,30];
                if (count _respawnPos == 0) then {_respawnPos = _pos};
                [_unit,_respawnPos] remoteExec ["uo_waverespawn_fnc_doRespawn",0,false];
            }, [_x,_pos], random 2] call CBA_fnc_waitAndExecute;
        } forEach (units _group);
    };
};
