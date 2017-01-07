deadPlayersBlu = [];
deadPlayersOpf = [];
newBluSpawns = [];
newOpfSpawns = [];

if (hasInterface) then {
    player setVariable ["joinTime", serverTime];
    _originalSide = player getVariable "originalSide";
    if (isNil "_originalSide") exitWith {
        ["fn_initWaveRespawn - ERROR: PLAYER %1 DOES NOT HAVE ORIGINALSIDE.", profileName] call uo_fnc_serverLog;
    };

    if (_originalSide == "WEST") then {
        player setVariable ["wr_waitCondition", {!WAVERESPAWNBLU}];
        player setVariable ["wr_interruptCondition", {COMMANDVEHICLEDESTROYED}];
        player setVariable ["wr_playersLeft", {WAVERESPAWNPLAYERSLEFTBLU}];
        player setVariable ["wr_waveTimeLeft", {WAVERESPAWNTIMELEFTBLU}];
        player setVariable ["wr_waveSize", BLUFORWAVESIZE];
    };
    if (_originalSide == "EAST") then {
        player setVariable ["wr_waitCondition", {!WAVERESPAWNOPF}];
        player setVariable ["wr_interruptCondition", {DEALERKILLED}];
        player setVariable ["wr_playersLeft", {WAVERESPAWNPLAYERSLEFTOPF}];
        player setVariable ["wr_waveTimeLeft", {WAVERESPAWNTIMELEFTOPF}];
        player setVariable ["wr_waveSize", OPFORWAVESIZE];
    };
};

if (isServer) then {
    [] call uo_fnc_startWaveLoops;
    addMissionEventHandler ["HandleDisconnect", {[_this select 3] call uo_fnc_removeFromWave}];
};
