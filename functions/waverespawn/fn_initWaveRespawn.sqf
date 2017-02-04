deadPlayersBlu = [];
deadPlayersOpf = [];
newBluSpawns = [];
newOpfSpawns = [];

if (hasInterface) then {
    player setVariable ["joinTime", serverTime];
    player setVariable ["wr_playerRespawnTimeLeft", uo_missionParam_RESPAWNTIME];
    player setVariable ["wr_interrupted", false];
    player setVariable ["wr_isFreeRespawn", false];
    player setVariable ["wr_playerCountdownDone", false];
    player setVariable ["wr_waveCountdownDone", false];
    player setVariable ["wr_cvCheckDone", false];
};

if (isServer) then {
    [] call uo_waverespawn_fnc_startWaveLoops;

    /*DEADPLAYERSBLU_GROUP = createGroup [civilian,false];  //FOR ARMA 1.67
    DEADPLAYERSOPF_GROUP = createGroup [civilian,false];*/

    DEADPLAYERSBLU_GROUP = createGroup civilian;
    DEADPLAYERSOPF_GROUP = createGroup civilian;
    publicVariable "DEADPLAYERSBLU_GROUP";
    publicVariable "DEADPLAYERSOPF_GROUP";
    DEADPLAYERSBLU_GROUP setVariable ["ace_map_hideBlueForceMarker",true,true];
    DEADPLAYERSOPF_GROUP setVariable ["ace_map_hideBlueForceMarker",true,true];

    addMissionEventHandler ["HandleDisconnect", {[_this select 3] call uo_waverespawn_fnc_removeFromWave}];
};
