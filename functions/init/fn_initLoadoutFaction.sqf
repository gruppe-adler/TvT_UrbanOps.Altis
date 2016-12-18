_terrainClass = if (UO_ISWOODLAND) then {"loadoutWood"} else {"loadoutDes"};
_blufor = getText (missionConfigFile >> "cfgFactions" >> BLUFORFACTION >> _terrainClass);
_opfor = getText (missionConfigFile >> "cfgFactions" >> OPFORFACTION >> _terrainClass);

["BLU_F", _blufor] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", _opfor] call GRAD_Loadout_fnc_FactionSetLoadout;

diag_log format ["fn_initLoadoutFaction - Blufor faction is %1.", _blufor];
diag_log format ["fn_initLoadoutFaction - Opfor faction is %1.", _opfor];
