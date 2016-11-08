params ["_deadPlayer", ["_deadPlayerSide", "UNKNOWN"]];

if (isNil "deadPlayersBlu") then {deadPlayersBlu = []};
if (isNil "deadPlayersOpf") then {deadPlayersOpf = []};

//add player to array
if (_deadPlayerSide == "WEST") then {
    deadPlayersBlu pushBack _deadPlayer;
    diag_log format ["addDeadPlayerToWave - added player %1 to deadPlayersBlu. %2 dead blufor total.", _deadPlayer, count deadPlayersBlu];
} else {
    if (_deadPlayerSide == "EAST") then {
        deadPlayersOpf pushBack _deadPlayer;
        diag_log format ["addDeadPlayerToWave - added player %1 to deadPlayersOpf. %2 dead opfor total.", _deadPlayer, count deadPlayersOpf];
    } else {        
        diag_log format ["addDeadPlayerToWave - ERROR, unknown side for player %1", _deadPlayer];
    };
};

WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE - (count deadPlayersBlu);
WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE - (count deadPlayersOpf);
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
