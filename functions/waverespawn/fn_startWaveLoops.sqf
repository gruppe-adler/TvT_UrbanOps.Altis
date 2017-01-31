#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

//BLUFOR =======================================================================
[{
    //dont execute while respawning is possible
    if (WAVERESPAWNBLU) exitWith {};

    //start countdown once first player is added to wave
    if (count deadPlayersBlu >= 1 && WAVERESPAWNTIMELEFTBLU <= uo_missionParam_WAVERESPAWNTIMEBLU) then {
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
        INFO("Respawning now possible for Blufor.");

        [{
                WAVERESPAWNBLU = false;
                publicVariable "WAVERESPAWNBLU";
                WAVERESPAWNTIMELEFTBLU = uo_missionParam_WAVERESPAWNTIMEBLU;
                publicVariable    "WAVERESPAWNTIMELEFTBLU";
                INFO("Respawning no longer possible for Blufor.");
        },[],(RESPAWNWAVEEXTRATIME max 7)] call CBA_fnc_waitAndExecute;
    };
}, 3, []] call CBA_fnc_addPerFrameHandler;

//OPFOR ========================================================================
[{
    //dont execute while respawning is possible
    if (WAVERESPAWNOPF) exitWith {};

    //start countdown once first player is added to wave
    if (count deadPlayersOpf >= 1 && WAVERESPAWNTIMELEFTOPF <= uo_missionParam_WAVERESPAWNTIMEOPF) then {
        [{
            WAVERESPAWNTIMELEFTOPF = WAVERESPAWNTIMELEFTOPF - 1;
            publicVariable "WAVERESPAWNTIMELEFTOPF";
            if (WAVERESPAWNTIMELEFTOPF <= 0) then {[_this select 1] call CBA_fnc_removePerFrameHandler};
        }, 1, []] call CBA_fnc_addPerFrameHandler;
    };

    //enable respawning when wave is full
    if (count deadPlayersOpf >= OPFORWAVESIZE && WAVERESPAWNTIMELEFTOPF <= 0 && !uo_DEALERKILLED) then {
        _opf_safeRespawnPos = [] call uo_waverespawn_fnc_findOpfSpawnPos;
        missionNamespace setVariable ["uo_opf_safeRespawnPos",_opf_safeRespawnPos,true];

        [{
            WAVERESPAWNOPF = true;
            publicVariable "WAVERESPAWNOPF";
            INFO("Respawning now possible for Opfor.");
        },[],2] call CBA_fnc_waitAndExecute;

        [{
                WAVERESPAWNOPF = false;
                publicVariable "WAVERESPAWNOPF";
                WAVERESPAWNTIMELEFTOPF = uo_missionParam_WAVERESPAWNTIMEOPF;
                publicVariable    "WAVERESPAWNTIMELEFTOPF";
                INFO("Respawning no longer possible for Opfor.");
                missionNamespace setVariable ["uo_opf_safeRespawnPos",nil,true];
        },[],(RESPAWNWAVEEXTRATIME max 8)] call CBA_fnc_waitAndExecute;
    };
}, 3, []] call CBA_fnc_addPerFrameHandler;
