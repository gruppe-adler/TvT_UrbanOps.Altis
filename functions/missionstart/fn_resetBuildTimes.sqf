[player,1] call grad_fortifications_fnc_setBuildTimeFactor;
[player,1] call grad_fortifications_fnc_setPackUpTimeFactor;

[[EAST],"BUILD TIMES RESET","Fortifications can no longer be built instantly."] call uo_common_fnc_sideNotification;
