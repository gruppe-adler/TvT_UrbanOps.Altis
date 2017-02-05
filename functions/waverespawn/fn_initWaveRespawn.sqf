deadPlayersBlu = [];
deadPlayersOpf = [];
newBluSpawns = [];
newOpfSpawns = [];

if (hasInterface) then {
    player setVariable ["joinTime", serverTime];
    [] call uo_waverespawn_fnc_resetPlayerVars;
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

    addMissionEventHandler ["HandleDisconnect", {[_this select 0,side (_this select 0)] call uo_waverespawn_fnc_removeFromWave}];
};
