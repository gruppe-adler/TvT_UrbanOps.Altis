if (!isServer) exitWith {};

//find pos
_pos = BLUFORSPAWN findEmptyPosition [0,150,COMMANDVEHICLECLASS];
if (str _pos == "[]") then {_pos = BLUFORSPAWN};

//spawn vehicle
COMMANDVEHICLE = COMMANDVEHICLECLASS createVehicle _pos;
[{!isNull COMMANDVEHICLE}, {
  publicVariable "COMMANDVEHICLE";
  missionNamespace setVariable ["uo_init_cvCreated", true, true];
  [COMMANDVEHICLE] call mcd_fnc_emptyContainer;
}, []] call CBA_fnc_waitUntilAndExecute;

//add EH
_h = COMMANDVEHICLE addEventHandler ["killed", {COMMANDVEHICLEDESTROYED = true; publicVariable "COMMANDVEHICLEDESTROYED"}];

diag_log format ["fn_createCommandVehicle - Killed EH created. Handle: %1.", _h];
