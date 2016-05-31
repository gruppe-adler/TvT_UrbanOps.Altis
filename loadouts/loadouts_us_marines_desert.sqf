this = player;

params ["_role"];
if (!isNil _role) then {call (compile ("call " + _role))} else {diag_log format ["loadouts.sqf - LOADOUT FOR %1 NOT FOUND!", _role]};
