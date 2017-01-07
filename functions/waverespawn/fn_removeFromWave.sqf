params [["_respawnedPlayer", ""], ["_respawnedSide", "UNKNOWN"], ["_respawnedUnit", objNull]];

switch (_respawnedSide) do {
    case "WEST": {
        if (_respawnedPlayer in deadPlayersBlu) then {
            deadPlayersBlu = deadPlayersBlu - [_respawnedPlayer];
            diag_log format ["fn_removeFromWave - Player %1 respawned and has been removed from deadPlayersBlu.", _respawnedPlayer];
        } else {
            diag_log format ["fn_removeFromWave - ERROR, player %1 is not in deadPlayersBlu", _respawnedPlayer];
        };
    };

    case "EAST": {
        if (_respawnedPlayer in deadPlayersOpf) then {
            deadPlayersOpf = deadPlayersOpf - [_respawnedPlayer];
            diag_log format ["fn_removeFromWave - Player %1 respawned and has been removed from deadPlayersOpf.", _respawnedPlayer];
        } else {
            diag_log format ["fn_removeFromWave - ERROR, player %1 is not in deadPlayersOpf", _respawnedPlayer];
        };
    };

    case "UNKNOWN": {
        if (_respawnedPlayer in deadPlayersBlu) then {
            deadPlayersBlu = deadPlayersBlu - [_respawnedPlayer];
            [_respawnedPlayer, "WEST"] call uo_fnc_addRespawnedToGroup;
            diag_log format ["fn_removeFromWave - Player %1 disconnected and has been removed from deadPlayersBlu", _respawnedPlayer];
        } else {
            if (_respawnedPlayer in deadPlayersOpf) then {
                deadPlayersOpf = deadPlayersOpf - [_respawnedPlayer];
                [_respawnedPlayer, "EAST"] call uo_fnc_addRespawnedToGroup;
                diag_log format ["fn_removeFromWave - Player %1 disconnected and has been removed from deadPlayersOpf", _respawnedPlayer];
            } else {
                diag_log format ["fn_removeFromWave - Player %1 disconnected but was not waiting for respawn", _respawnedPlayer];
            };
        };
    };

    default {diag_log format ["fn_removeFromWave - ERROR, player %1 is neither WEST nor EAST nor UNKNOWN", _respawnedPlayer]};
};

[_respawnedUnit, _respawnedSide] call uo_fnc_addRespawnedToGroup;

[
    {
        WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE - (count deadPlayersBlu);
        WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE - (count deadPlayersOpf);
        publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
        publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
    }, [], RESPAWNWAVEEXTRATIME
] call CBA_fnc_waitAndExecute;
