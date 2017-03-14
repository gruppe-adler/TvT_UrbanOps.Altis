if (!isServer) exitWith {};

//SETTINGS =====================================================================
_sizeFactor = [(missionConfigFile >> "CfgIslands" >>  worldName >> "sizeFactor"), "number", 1] call CBA_fnc_getConfigEntry;

BLUFORSPAWNDIST = 1200 * _sizeFactor;
BLUFORSPAWNBAND = 800 * _sizeFactor;
BLUFORSTARTDIST = (BLUFORSPAWNDIST + BLUFORSPAWNBAND + 800 * _sizeFactor);
OPFORRESPAWNDIST = 100;
CIVILIANPROBABILITY = 3.5;
DEALERRADIUSFACTOR = 0.75;																										    //CITYAREASIZE * DEALERRADIUSFACTOR == DEALERSPAWNRADIUS
CVENEMYRADIUS = 100;
RESPAWNCREDITS = 2000;
uo_FLAGAMOUNT = 3;
uo_FLAGRADIUS = 5;

publicVariable "BLUFORSPAWNDIST";
publicVariable "BLUFORSPAWNBAND";
publicVariable "BLUFORSTARTDIST";
publicVariable "OPFORRESPAWNDIST";
publicVariable "CIVILIANPROBABILITY";
publicVariable "DEALERRADIUSFACTOR";
publicVariable "RESPAWNCREDITS";

//LOCATION MARKERS =============================================================
VILLAGEMARKERSIZE = 200 * ((_sizeFactor * 1.5) min 1);
CITYMARKERSIZE = 300 * ((_sizeFactor * 1.5) min 1);
CAPITALMARKERSIZE = 400 * ((_sizeFactor * 1.5) min 1);
OTHERMARKERSIZE = 200 * ((_sizeFactor * 1.5) min 1);

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
AUTOCHOOSETIMEOUT = 60;
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
publicVariable "AUTOCHOOSETIMEOUT";
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
