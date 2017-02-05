/*    handles player respawn
*
*     executed locally when player dies
*/

#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (player getVariable ["wr_interrupted", false]) exitWith {};

[] call uo_waverespawn_fnc_resetPlayerVars;

//check JIP player is spawning for the first time
_joinTime = player getVariable ["joinTime", 0];
if (serverTime - _joinTime < 30 && didJIP) exitWith {INFO("Player is JIP. Exiting onPlayerKilled.")};

["RESTRICTED"] call uo_common_fnc_startSpectator;

INFO("Starting waverespawn procedure...");
[true] call uo_waverespawn_fnc_blockMap;
_timeOfDeath = time;
player setVariable ["wr_timeOfDeath",time];

//respawn player, put him in spec mode
setPlayerRespawnTime 0;
forceRespawn player;
player allowDamage false;
[{alive player},{
    setPlayerRespawnTime 9999;
    player enableSimulation false;
    TF_max_voice_volume call TFAR_fnc_setVoiceVolume;
    [playerSide,player] remoteExec ["uo_waverespawn_fnc_addToWaitGroup",2,false];
},[]] call CBA_fnc_waitUntilAndExecute;

//do the steps
[_timeOfDeath] call uo_waverespawn_fnc_playerCountdown;
[{player getVariable "wr_playerCountdownDone"}, {_this call uo_waverespawn_fnc_waveCountdown}, [_timeOfDeath]] call CBA_fnc_waitUntilAndExecute;
[{player getVariable "wr_waveCountdownDone"}, {[] call uo_waverespawn_fnc_prepareRespawn}, []] call CBA_fnc_waitUntilAndExecute;
