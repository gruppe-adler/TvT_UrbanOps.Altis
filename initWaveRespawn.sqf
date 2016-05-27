WAVERESPAWNTIME = "waverespawntime" call BIS_fnc_getParamValue;
RESPAWNTIME = "respawntime" call BIS_fnc_getParamValue;
OPFORRESPAWNENABLED = ("OpforRespawn" call BIS_fnc_getParamValue) == 1;
RESPAWNWAVEEXTRATIME = 30;

if (hasInterface) then {
  joinTime = serverTime;

  [] spawn {
    waitUntil {!isNull player};
    waitUntil {alive player};
    _count = 0;
    originalSide = "CIV";
    while {sleep 1; originalSide == "CIV"} do {
      originalSide = str side player;
      _count = _count + 1;
      if (_count > 10) exitWith {diag_log "Player side is CIV. This might be a bug."}
    };
  };
};

if (isServer) then {

  //ADD TO WAVE FUNCTION =======================================================
  mcd_fnc_addDeadPlayerToWave = {
    params ["_deadPlayer", "_deadPlayerSide"];

    //wait until handleRespawns.sqf has declared dead player arrays
    waitUntil {!isNil "deadPlayersBlu"};
    waitUntil {!isNil "deadPlayersOpf"};

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
  };

  //REMOVE FROM WAVE FUNCTION ==================================================
  mcd_fnc_removeRespawnedFromList = {
    _respawnedPlayer = param [0,""];
    _respawnedSide = param [1,"UNKNOWN"];

    switch (_respawnedSide) do {

      case "WEST": {
        if (_respawnedPlayer in deadPlayersBlu) then {
          deadPlayersBlu = deadPlayersBlu - [_respawnedPlayer];
          diag_log format ["removeRespawnedFromList - Player %1 respawned and has been removed from deadPlayersBlu.", _respawnedPlayer];
        } else {
          diag_log format ["removeRespawnedFromList - ERROR, player %1 is not in deadPlayersBlu", _respawnedPlayer];
        };
      };

      case "EAST": {
        if (_respawnedPlayer in deadPlayersOpf) then {
          deadPlayersOpf = deadPlayersOpf - [_respawnedPlayer];
          diag_log format ["removeRespawnedFromList - Player %1 respawned and has been removed from deadPlayersOpf.", _respawnedPlayer];
        } else {
          diag_log format ["removeRespawnedFromList - ERROR, player %1 is not in deadPlayersOpf", _respawnedPlayer];
        };
      };

      case "UNKNOWN": {
        if (_respawnedPlayer in deadPlayersBlu) then {
          deadPlayersBlu = deadPlayersBlu - [_respawnedPlayer];
          diag_log format ["removeRespawnedFromList - Player %1 disconnected and has been removed from deadPlayersBlu", _respawnedPlayer];
        } else {
          if (_respawnedPlayer in deadPlayersOpf) then {
            deadPlayersOpf = deadPlayersOpf - [_respawnedPlayer];
            diag_log format ["removeRespawnedFromList - Player %1 disconnected and has been removed from deadPlayersOpf", _respawnedPlayer];
          } else {
            diag_log format ["removeRespawnedFromList - Player %1 disconnected but was not waiting for respawn", _respawnedPlayer];
          };
        };
      };

      default {diag_log format ["removeRespawnedFromList - ERROR, player %1 is neither WEST nor EAST nor UNKNOWN", _respawnedPlayer]};
    };

    //wait extra respawn time
    sleep RESPAWNWAVEEXTRATIME;

    WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE - (count deadPlayersBlu);
    WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE - (count deadPlayersOpf);
    publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
    publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
  };

  //WAVE SIZE ==================================================================
  _bluforWaveSize = "bluforwavesize" call BIS_fnc_getParamValue;
  _opforWaveSize = "opforwavesize" call BIS_fnc_getParamValue;

  _allPlayers = [] call BIS_fnc_listPlayers;

  if (_bluforWaveSize == 0) then {
    _teamSize = west countside _allPlayers;
    BLUFORWAVESIZE = (ceil ((_teamSize / 3) - 0.5)) max 1;
  } else {
    BLUFORWAVESIZE = _bluforWaveSize;
  };

  if (_opforWaveSize == 0) then {
    _teamSize = east countside _allPlayers;
    OPFORWAVESIZE = (ceil ((_teamSize / 3) - 0.5)) max 1;
  } else {
    OPFORWAVESIZE = _opforWaveSize;
  };

  publicVariable "BLUFORWAVESIZE";
  publicVariable "OPFORWAVESIZE";
  diag_log format ["Wave Respawn - Blufor wave size is %1", BLUFORWAVESIZE];
  diag_log format ["Wave Respawn - Opfor wave size is %1", OPFORWAVESIZE];

  //============================================================================
  addMissionEventHandler ["HandleDisconnect", {[_this select 3] spawn mcd_fnc_removeRespawnedFromList}];
  [] execVM "server\waveRespawn.sqf";
};
