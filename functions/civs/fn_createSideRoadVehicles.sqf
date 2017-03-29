#define PREFIX uo
#define COMPONENT civs
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_houses"];


//LOCAL FUNCTIONS ==============================================================
_fnc_createMarker = {
    params ["_pos","_canCreate"];

    if (isNil "uo_civs_sideRoadVehicleMarkers") then {uo_civs_sideRoadVehicleMarkers = []};

    _color = switch (_canCreate) do {
        case ("UNSAFE"): {"COLORRED"};
        case ("ONROAD"): {"COLOREAST"};
        case ("ONINTERSECTION"): {"COLORYELLOW"};
        case ("NOHOUSES"): {"ColorKhaki"};
        case ("TOOCLOSE"): {"ColorBlue"};
        default {"COLORGREEN"};
    };

    _markerName = format ["uo_civs_sideRoadVehicleMarker_%1",count uo_civs_sideRoadVehicleMarkers];
    _marker = createMarker [_markerName, _pos];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "mil_triangle";
    _marker setMarkerColor _color;

    uo_civs_sideRoadVehicleMarkers pushBack _marker;
};

_fnc_nearbyVehiclePositions = {
    params ["_pos"];

    _nearbyVehiclePositions = [];
    {if (_pos distance2D _x < 20) then {_nearbyVehiclePositions pushBack _x}} forEach uo_civs_sideRoadVehiclePositions;
    _nearbyVehiclePositions
};

_fnc_isSafe = {
    params ["_pos"];
    !(([_pos, 0, 0, 2, 0, 0.6, 0,"",[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos) isEqualTo [0,0,0])
};


//DELETE OLD ENTITIES ==========================================================
if (!isNil "uo_civs_sideRoadVehicleMarkers") then {
    {deleteMarker _x} forEach uo_civs_sideRoadVehicleMarkers;
    uo_civs_sideRoadVehicleMarkers = [];
};
if (!isNil "uo_civs_sideRoadVehicles") then {
    {deleteVehicle _x} forEach uo_civs_sideRoadVehicles;
};
uo_civs_sideRoadVehicles = [];
uo_civs_sideRoadVehiclePositions = [];

//MAIN =========================================================================
_roads = CITYPOSITION nearRoads (CITYAREASIZE+100);
_vehiclesToCreate = (((count _houses) * 0.07) min ((count _roads) * 0.07));
_vehiclesToCreate = round (_vehiclesToCreate * ((random 0.4) + 0.8));
_vehiclesToCreate = (_vehiclesToCreate min 20) max 4;

while {count _roads > 0 && count uo_civs_sideRoadVehiclePositions < _vehiclesToCreate} do {
    private ["_vehPos","_canCreate","_chosenDirection","_offRoadFound"];

    _randomRoadID = round (random ((count _roads)-1));
    _road = _roads deleteAt _randomRoadID;

    if (!isNull _road) then {
        if (count (roadsConnectedTo _road) == 0) exitWith {};
        _roadDir = _road getDir ((roadsConnectedTo _road) select 0);
        _boundingBox = boundingBox _road;
        _width = ((_boundingBox select 1) select 0) - ((_boundingBox select 0) select 0);

        _startDirection = selectRandom [1,-1];
        {
            _chosenDirection = _x;
            _offRoadFound = false;
            for [{_i=1}, {_i<50}, {_i=_i+1}] do {
                _testPos = _road getRelPos [1.5 + _i*0.2,_roadDir+90*_chosenDirection];
                _vehPos = _testPos;
                if (!isOnRoad _testPos) exitWith {_offRoadFound = true};
            };

            _enoughHouses = (count ([_vehPos,20] call uo_common_fnc_findBuildings)) * 30 > random 100;

            _canCreate = switch (true) do {
                case (!_offRoadFound): {"ONROAD"};
                case (count (getPos _road nearRoads 10) > 2): {"ONINTERSECTION"};
                case (!_enoughHouses): {"NOHOUSES"};
                case (count ([_vehPos] call _fnc_nearbyVehiclePositions) > 0): {"TOOCLOSE"};
                case (!([_vehPos] call _fnc_isSafe)): {"UNSAFE"};
                default {"CANCREATE"};
            };

            if (_forEachIndex == 1) then {_roadDir = _roadDir + 180};
            if (_canCreate == "CANCREATE") exitWith {};
        } forEach [_startDirection,-_startDirection];

        if (uo_missionParam_PRESET == "DEBUG") then {
            [_vehPos,_canCreate] call _fnc_createMarker;
        };

        if (_canCreate == "CANCREATE") then {
            _type = selectRandom uo_civs_vehicles;
            uo_civs_sideRoadVehiclePositions pushBack _vehPos;
            _veh = createVehicle [_type,[0,0,0],[],0,"CAN_COLLIDE"];
            [{!isNull (_this select 0)}, {
                params ["_veh","_roadDir","_chosenDirection","_vehPos"];
                _veh setDir _roadDir + (90 + 90*_chosenDirection);
                _veh setPos _vehPos;
                _veh setVelocity [0,0,1];
                _veh lock 2;
                [_veh] call uo_civs_fnc_deleteIfDamaged;
                uo_civs_sideRoadVehicles pushBack _veh;
            }, [_veh,_roadDir,_chosenDirection,_vehPos]] call CBA_fnc_waitUntilAndExecute;
        };
    };
};

INFO_2("Tried to create %1 vehicles along roads. Created %2.",_vehiclesToCreate,count uo_civs_sideRoadVehiclePositions);
