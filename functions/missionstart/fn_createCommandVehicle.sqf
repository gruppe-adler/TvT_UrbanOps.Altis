if (!isServer) exitWith {};

//find pos
_pos = BLUFORSPAWN findEmptyPosition [0,150,COMMANDVEHICLECLASS];
if (str _pos == "[]") then {_pos = BLUFORSPAWN};

//spawn vehicle
COMMANDVEHICLE = COMMANDVEHICLECLASS createVehicle _pos;
[COMMANDVEHICLE] call mcd_fnc_emptyContainer;
[{!isNull COMMANDVEHICLE}, {publicVariable "COMMANDVEHICLE"; missionNamespace setVariable ["uo_init_cvCreated", true, true]}, []] call CBA_fnc_waitUntilAndExecute;

//add EH
COMMANDVEHICLE addEventHandler ["killed", {COMMANDVEHICLEDESTROYED = true; publicVariable "COMMANDVEHICLEDESTROYED"}];
