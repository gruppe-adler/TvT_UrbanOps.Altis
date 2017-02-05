params ["_sector"];

_westUnitsCount = {
    alive _x &&
    side _x == WEST &&
    [getPos _x] call uo_sectors_fnc_getSector == _sector
} count (missionNamespace getVariable ["uo_unitsInCityArea",[]]);

_eastUnitsCount = {
    alive _x &&
    side _x == EAST &&
    [getPos _x] call uo_sectors_fnc_getSector == _sector
} count (missionNamespace getVariable ["uo_unitsInCityArea",[]]);

_isActive = if (_eastUnitsCount >= _westUnitsCount) then {true} else {false};

_isActive
