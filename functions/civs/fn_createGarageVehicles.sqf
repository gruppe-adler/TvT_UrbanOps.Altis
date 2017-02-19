#define PREFIX uo
#define COMPONENT civs
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_houses"];

if (!isNil "uo_civs_garageVehicleMarkers") then {
    {deleteMarker _x} forEach uo_civs_garageVehicleMarkers;
    uo_civs_garageVehicleMarkers = [];
};

if (!isNil "uo_civs_sideRoadVehicles") then {
    {deleteVehicle _x} forEach uo_civs_sideRoadVehicles;
};
uo_civs_sideRoadVehicles = [];

_garages = _houses select {typeOf _x in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F","Land_i_Garage_V1_dam_F"]};
{
    if (20 > random 100) then {
        _type = selectRandom uo_civs_vehicles;
        _veh = createVehicle [_type,[0,0,0],[],0,"CAN_COLLIDE"];
        [{!isNull (_this select 0)}, {
            params ["_veh","_garage"];
            _veh setDir (getDir _garage) + (selectRandom [90,270]);
            _veh setPos (getPos _garage);
            _veh lock 2;
            uo_civs_garageVehicles pushBack _veh;
            [_veh] call uo_civs_fnc_deleteIfDamaged;
        },[_veh,_x]] call CBA_fnc_waitUntilAndExecute;

        if (uo_missionParam_PRESET in ["DEBUG_SINGLE","DEBUG_MULTI"]) then {
            _markerName = format ["uo_civs_garageVehicleMarker_%1",count uo_civs_garageVehicleMarkers];
            _marker = createMarker [_markerName, getPos _x];
            _marker setMarkerShape "ICON";
            _marker setMarkerType "mil_box";
            _marker setMarkerColor "COLORGREEN";
            uo_civs_garageVehicleMarkers pushBack _marker;
        };
    };
} forEach _garages;

INFO_2("Found %1 garages. Created %1 vehicles in garages.",count _garages,count uo_civs_garageVehicleMarkers);
