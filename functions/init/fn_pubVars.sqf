if (!isServer) exitWith {};

//SETTINGS =====================================================================
BLUFORSPAWNDIST = 1200;
BLUFORSPAWNBAND = 800;
BLUFORSTARTDIST = BLUFORSPAWNDIST + BLUFORSPAWNBAND + 800;
OPFORRESPAWNDIST = 100;
CIVILIANPROBABILITY = 3.5;
DEALERRADIUSFACTOR = 0.75;																										    //CITYAREASIZE * DEALERRADIUSFACTOR == DEALERSPAWNRADIUS
CVENEMYRADIUS = 100;

publicVariable "BLUFORSPAWNDIST";
publicVariable "BLUFORSPAWNBAND";
publicVariable "BLUFORSTARTDIST";
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
WAVERESPAWNTIMELEFTBLU = uo_missionParam_WAVERESPAWNTIMEBLU;
WAVERESPAWNTIMELEFTOPF = uo_missionParam_WAVERESPAWNTIMEOPF;
MAXRESPAWNTIME = 1200;
RESPAWNWAVEEXTRATIME = 30;
WAVERESPAWNSTATUSBLU = "";
WAVERESPAWNSTATUSOPF = "";

publicVariable "WAVERESPAWNBLU";
publicVariable "WAVERESPAWNOPF";
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
publicVariable "WAVERESPAWNTIMELEFTBLU";
publicVariable "WAVERESPAWNTIMELEFTOPF";
publicVariable "MAXRESPAWNTIME";
publicVariable "RESPAWNWAVEEXTRATIME";
publicVariable "WAVERESPAWNSTATUSBLU";
publicVariable "WAVERESPAWNSTATUSOPF";

//OTHER ========================================================================
OPFORTELEPORTED = false;
BLUFORTELEPORTED = false;
GAMESTARTED = false;
GAMEENDED = false;
BLUFORINCONTROL = false;
BLUFORELIMINATED = false;
OPFORELIMINATED = false;
COMMANDVEHICLEDESTROYED = false;
CVININNER = false;
CVINOUTER = false;
CVACTIVE = false;
uo_DEALERKILLED = false;
CIVSKILLEDBLU = 0;
CIVSKILLEDOPF = 0;
CAPTURETIMEREMAINING = uo_missionParam_CAPTURETIME;

publicVariable "OPFORTELEPORTED";
publicVariable "BLUFORTELEPORTED";
publicVariable "GAMESTARTED";
publicVariable "GAMEENDED";
publicVariable "BLUFORINCONTROL";
publicVariable "BLUFORELIMINATED";
publicVariable "OPFORELIMINATED";
publicVariable "COMMANDVEHICLEDESTROYED";
publicVariable "CVININNER";
publicVariable "CVINOUTER";
publicVariable "CVACTIVE";
publicVariable "uo_DEALERKILLED";
publicVariable "CIVSKILLEDBLU";
publicVariable "CIVSKILLEDOPF";
publicVariable "CAPTURETIMEREMAINING";

//DONE =========================================================================
missionNamespace setVariable ["uo_init_pubVarsDone", true, true];
