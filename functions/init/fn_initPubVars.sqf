if (!isServer) exitWith {};

//SETTINGS =====================================================================
BLUFORSPAWNDIST = 1200;
BLUFORSPAWNBAND = 1000;
OPFORRESPAWNDIST = 100;
CIVILIANPROBABILITY = 5;
DEALERRADIUSFACTOR = 0.75;																										  //CITYAREASIZE * DEALERRADIUSFACTOR == DEALERSPAWNRADIUS

publicVariable "BLUFORSPAWNDIST";
publicVariable "BLUFORSPAWNBAND";
publicVariable "OPFORRESPAWNDIST";
publicVariable "CIVILIANPROBABILITY";
publicVariable "DEALERRADIUSFACTOR";

//LOCATION MARKERS =============================================================
VILLAGEMARKERSIZE = 200;
CITYMARKERSIZE = 300;
CAPITALMARKERSIZE = 400;
OTHERMARKERSIZE = 200;

publicVariable "VILLAGEMARKERSIZE";
publicVariable "CITYMARKERSIZE";
publicVariable "CAPITALMARKERSIZE";
publicVariable "OTHERMARKERSIZE";

//WAVE RESPAWN =================================================================
WAVERESPAWNBLU = false;
WAVERESPAWNOPF = false;
WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE;
WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE;
WAVERESPAWNTIMELEFTBLU = WAVERESPAWNTIME;
WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIME;
MAXRESPAWNTIME = 1000;
RESPAWNWAVEEXTRATIME = 30;

publicVariable "WAVERESPAWNBLU";
publicVariable "WAVERESPAWNOPF";
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
publicVariable "WAVERESPAWNTIMELEFTBLU";
publicVariable "WAVERESPAWNTIMELEFTOPF";
publicVariable "MAXRESPAWNTIME";
publicVariable "RESPAWNWAVEEXTRATIME";

//OTHER ========================================================================
OPFORTELEPORTED = false;
BLUFORTELEPORTED = false;
GAMESTARTED = false;
GAMEENDED = false;
BLUFORINCONTROL = false;
BLUFORELIMINATED = false;
OPFORELIMINATED = false;
CITYCAPTURED = false;
CITYDEFENDED = false;
COMMANDVEHICLEDESTROYED = false;
CVININNER = false;
CVINOUTER = false;
CVACTIVE = false;
DEALERKILLED = false;
CIVSKILLEDBLU = 0;
CIVSKILLEDOPF = 0;
CAPTURETIMEREMAINING = CAPTURETIME;

publicVariable "OPFORTELEPORTED";
publicVariable "BLUFORTELEPORTED";
publicVariable "GAMESTARTED";
publicVariable "GAMEENDED";
publicVariable "BLUFORINCONTROL";
publicVariable "BLUFORELIMINATED";
publicVariable "OPFORELIMINATED";
publicVariable "CITYCAPTURED";
publicVariable "CITYDEFENDED";
publicVariable "COMMANDVEHICLEDESTROYED";
publicVariable "CVININNER";
publicVariable "CVINOUTER";
publicVariable "CVACTIVE";
publicVariable "DEALERKILLED";
publicVariable "CIVSKILLEDBLU";
publicVariable "CIVSKILLEDOPF";
publicVariable "CAPTURETIMEREMAINING";

//DONE =========================================================================
missionNamespace setVariable ["uo_init_pubVarsDone", true, true];
