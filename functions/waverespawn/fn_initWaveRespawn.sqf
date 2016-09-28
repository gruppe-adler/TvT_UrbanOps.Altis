RESPAWNWAVEEXTRATIME = 30;

if (hasInterface) then {
  player setVariable ["joinTime", serverTime];
  _originalSide = [] call mcd_fnc_originalSide;
  player setVariable ["originalSide", _originalSide];

  if (_originalSide == "WEST") then {
    player setVariable ["wr_waitCondition", {!WAVERESPAWNBLU}];
    player setVariable ["wr_interruptCondition", {COMMANDVEHICLEDESTROYED}];
    player setVariable ["wr_playersLeft", {WAVERESPAWNPLAYERSLEFTBLU}];
    player setVariable ["wr_waveTimeLeft", WAVERESPAWNTIMELEFTBLU]
  };
  if (_originalSide == "EAST") then {
    player setVariable ["wr_waitCondition", {!WAVERESPAWNOPF}];
    player setVariable ["wr_interruptCondition", {DEALERKILLED}];
    player setVariable ["wr_playersLeft", {WAVERESPAWNPLAYERSLEFTOPF}];
    player setVariable ["wr_waveTimeLeft", WAVERESPAWNTIMELEFTOPF]
  };
};

if (isServer) then {
  [] call mcd_fnc_setWaveSize;
  [] call mcd_fnc_startWaveLoops;
  addMissionEventHandler ["HandleDisconnect", {[_this select 3] call mcd_fnc_removeFromWave}];
};
