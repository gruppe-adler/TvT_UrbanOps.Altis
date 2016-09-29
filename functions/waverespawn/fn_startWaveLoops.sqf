//BLUFOR =======================================================================
[{
  //dont execute while respawning is possible
  if (WAVERESPAWNBLU) exitWith {};

  //start countdown once first player is added to wave
  if (count deadPlayersBlu >= 1 && WAVERESPAWNTIMELEFTBLU == WAVERESPAWNTIME) then {
    [{
      WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIMELEFTBLU - 1;
      publicVariable "WAVERESPAWNTIMELEFTBLU";
      if (WAVERESPAWNTIMELEFTBLU <= 0) then {[_this select 1] call CBA_fnc_removePerFrameHandler};
    }, 1, []] call CBA_fnc_addPerFrameHandler;
  };

  //enable respawning when wave is full
  if (count deadPlayersBlu >= BLUFORWAVESIZE && WAVERESPAWNTIMELEFTBLU <= 0) then {
    WAVERESPAWNBLU = true;
    publicVariable "WAVERESPAWNBLU";
    diag_log "handleRespawns.sqf - Respawning now possible for Blufor.";

    [{
        WAVERESPAWNBLU = false;
        publicVariable "WAVERESPAWNBLU";
        WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIME;
        publicVariable  "WAVERESPAWNTIMELEFTBLU";
        diag_log "handleRespawns.sqf - Respawning no longer possible for Blufor.";
    },[],(RESPAWNWAVEEXTRATIME max 7)] call CBA_fnc_waitAndExecute;
  };
}, 3, []] call CBA_fnc_addPerFrameHandler;

//OPFOR ========================================================================
[{
  //dont execute while respawning is possible
  if (WAVERESPAWNOPF) exitWith {};

  //start countdown once first player is added to wave
  if (count deadPlayersOpf >= 1 && WAVERESPAWNTIMELEFTOPF == WAVERESPAWNTIME) then {
    [{
      WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIMELEFTOPF - 1;
      publicVariable "WAVERESPAWNTIMELEFTOPF";
      if (WAVERESPAWNTIMELEFTOPF <= 0) then {[_this select 1] call CBA_fnc_removePerFrameHandler};
    }, 1, []] call CBA_fnc_addPerFrameHandler;
  };

  //enable respawning when wave is full
  if (count deadPlayersOpf >= OPFORWAVESIZE && WAVERESPAWNTIMELEFTOPF <= 0) then {
    WAVERESPAWNOPF = true;
    publicVariable "WAVERESPAWNOPF";
    diag_log "handleRespawns.sqf - Respawning now possible for Opfor.";

    [{
        WAVERESPAWNOPF = false;
        publicVariable "WAVERESPAWNOPF";
        WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIME;
        publicVariable  "WAVERESPAWNTIMELEFTOPF";
        diag_log "handleRespawns.sqf - Respawning no longer possible for Opfor.";
    },[],(RESPAWNWAVEEXTRATIME max 7)] call CBA_fnc_waitAndExecute;
  };
}, 3, []] call CBA_fnc_addPerFrameHandler;
