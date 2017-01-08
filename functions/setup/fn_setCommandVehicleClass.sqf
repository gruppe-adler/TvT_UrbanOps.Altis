_cfg = missionConfigFile >> "CfgFactions" >> uo_missionParam_BLUFORFACTION;
if (!isClass _cfg) exitWith {diag_log format ["fn_setCommandVehicle - ERROR: %1 IS NOT A VALID FACTION.", uo_missionParam_BLUFORFACTION]};
_cvs = getArray (_cfg >> "commandVehicles");

_camo = if (uo_missionParam_ISWOODLAND) then {0} else {1};
COMMANDVEHICLECLASS = _cvs select _camo;
publicVariable "COMMANDVEHICLECLASS";

diag_log format ["fn_setCommandVehicle - Command vehicle is %1.", COMMANDVEHICLECLASS];
