["RESTRICTED"] call uo_common_fnc_startSpectator;
[] call uo_waverespawn_fnc_onPlayerKilled;
[player, true] call TFAR_fnc_forceSpectator;
