missionNamespace setVariable ["uo_init_gameStartTime", serverTime, true];
missionNamespace setVariable ["uo_init_gameStartTime",CBA_missionTime,true];
missionNamespace setVariable ["uo_endings_defenseTimeLeft",uo_missionParam_DEFENSETIME];
missionNamespace setVariable ["uo_init_gamestarted", true, true];

[[EAST],"BLUFOR SPAWNED","Game started."] call uo_common_fnc_sideNotification
