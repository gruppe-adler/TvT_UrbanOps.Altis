#include "script_component.hpp"

params ["_group","_pos"];

_group setVariable [QGVAR(groupIsRespawned),true,true];

if (side _group == WEST) then {
    {
        [{
            params ["_unit","_pos"];
            _respawnPos = (_pos getPos [random 6,random 360]) findEmptyPosition [0,30];
            if (count _respawnPos == 0) then {_respawnPos = _pos};
            [_unit,_respawnPos] remoteExec [QFUNC(doRespawn),0,false];
        }, [_x,_pos], random 4] call CBA_fnc_waitAndExecute;
    } forEach (units _group);
};

if (side _group == EAST) then {
    _pos = [_pos] call FUNC(findOpfRespawnPos);

    //spawn in city
    if (uo_missionParam_OPFORRESPAWNMODE == 1) then {
        _building = [_pos,count (units _group)] call FUNC(findBuilding);
        if (!isNull _building) then {
            INFO_2("Respawning %1 group %2 in nearby building.",side _group,groupID _group);
            _buildingPositions = [_building] call EFUNC(common,findBuildingPositions);
            {
                [{
                    params ["_unit","_pos"];
                    [_unit,_pos] remoteExec [QFUNC(doRespawn),0,false];
                }, [_x,_buildingPositions select _forEachIndex], random 2] call CBA_fnc_waitAndExecute;
            } forEach (units _group);
        } else {
            INFO_2("No building found for %1 group %2.",side _group,groupID _group);
            {
                [{
                    params ["_unit","_pos"];
                    _respawnPos = (_pos getPos [random 6,random 360]) findEmptyPosition [0,30];
                    if (count _respawnPos == 0) then {_respawnPos = _pos};
                    [_unit,_respawnPos] remoteExec [QFUNC(doRespawn),0,false];
                }, [_x,_pos], random 4] call CBA_fnc_waitAndExecute;
            } forEach (units _group);
        };

    //spawn outside city
    } else {
        //spawn a vehicle of the commandvehicle class
        _vehicleClass = [uo_missionParam_OPFORFACTION] call EFUNC(missionObjectives,getCommandVehicleClass);
        _roads = _pos nearRoads 400;
        if (count _roads > 0) then {
            _pos = getPos (selectRandom _roads);
        } else {
            _pos = [_pos,[0,200],[0,360],_vehicleClass] call EFUNC(common,findRandomPos);
        };

        _veh = createVehicle [_vehicleClass,_pos,[],0,"NONE"];
        [{!isNull _this}, {
            [EAST,nil,_this] call EFUNC(buyables,initVehicleLock);
            [_this] call EFUNC(common,emptyContainer);
            [_this] remoteExec [QEFUNC(missionObjectives,onCvCreate),0,true];
        },_veh] call CBA_fnc_waitUntilAndExecute;

        INFO_2("Random respawn outside playzone for %1 group %2 at %3.",side _group,groupID _group,_pos);
        {
            [{
                params ["_unit","_pos"];
                _respawnPos = (_pos getPos [random 6,random 360]) findEmptyPosition [0,30];
                if (count _respawnPos == 0) then {_respawnPos = _pos};
                [_unit,_respawnPos] remoteExec [QFUNC(doRespawn),0,false];
            }, [_x,_pos], random 4] call CBA_fnc_waitAndExecute;
        } forEach (units _group);
    };
};
