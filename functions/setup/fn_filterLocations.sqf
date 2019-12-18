params ["_locationArray"];

_locationBlacklist = [(missionConfigFile >> "CfgGradIslands" >>  worldName >> "urbanops_locationBlacklist"), "array", []] call CBA_fnc_getConfigEntry;

_return = [];
{
    if !(text _x in _locationBlacklist) then {
        _return pushBack _x;
    };
} forEach _locationArray;

_return
