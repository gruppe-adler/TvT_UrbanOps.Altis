if (!isServer) exitWith {};

params ["_searchPos"];
_pos = _searchPos findEmptyPosition [0,150,COMMANDVEHICLECLASS];
if (str _pos == "[]") then {_pos = _searchPos};

//spawn vehicle
_cv = COMMANDVEHICLECLASS createVehicle _pos;
[{!isNull (_this select 0)}, {
    params ["_cv"];

    [_cv] call uo_fnc_setCommandVehicle;
    diag_log format ["fn_createCommandVehicle - Command vehicle %1 created.", _cv];
    missionNamespace setVariable ["uo_init_cvCreated", true, true];
    
}, [_cv]] call CBA_fnc_waitUntilAndExecute;
