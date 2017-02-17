params ["_locationArray"];

_locationBlacklist = [(missionConfigFile >> "CfgIslands" >>  worldName >> "locationBlacklist"), "array", []] call CBA_fnc_getConfigEntry;

_return = [];
{
    if !(text _x in _locationBlacklist) then {
        diag_log format ["asdkjh %1 is blacklisted",text _x];
        _return pushBack _x;
    };
} forEach _locationArray;

_return
