#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

switch (playerSide) do {
    case (WEST): {
        player setVariable ["wr_waitCondition", {!WAVERESPAWNBLU}];
        player setVariable ["wr_interruptCondition", {count uo_cv_allCVs == 0 || !uo_missionParam_BLUFORRESPAWNENABLED || ({_x getVariable ["uo_respawnObject_isActive", false]} count uo_cv_allCVs == 0 && ({side _x == west} count playableUnits) == 0)}];
        player setVariable ["wr_playersLeft", {WAVERESPAWNPLAYERSLEFTBLU}];
        player setVariable ["wr_waveTimeLeft", {WAVERESPAWNTIMELEFTBLU}];
        player setVariable ["wr_waveSize", BLUFORWAVESIZE];
    };
    case (EAST): {
        player setVariable ["wr_waitCondition", {!WAVERESPAWNOPF}];
        player setVariable ["wr_interruptCondition", {uo_DEALERKILLED || !uo_missionParam_OPFORRESPAWNENABLED}];
        player setVariable ["wr_playersLeft", {WAVERESPAWNPLAYERSLEFTOPF}];
        player setVariable ["wr_waveTimeLeft", {WAVERESPAWNTIMELEFTOPF}];
        player setVariable ["wr_waveSize", OPFORWAVESIZE];
    };
    default {
        ERROR_1("Playerside is %1",playerSide);
    };
};

player setVariable ["wr_playerRespawnTimeLeft", uo_missionParam_RESPAWNTIME];
player setVariable ["wr_interrupted", false];
player setVariable ["wr_isFreeRespawn", false];
player setVariable ["wr_playerCountdownDone", false];
player setVariable ["wr_waveCountdownDone", false];
player setVariable ["wr_cvCheckDone", false];
