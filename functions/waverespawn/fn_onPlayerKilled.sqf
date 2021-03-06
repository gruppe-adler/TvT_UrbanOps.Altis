/*    handles player respawn
*
*     executed locally when player dies
*/

#include "script_component.hpp"

if (player getVariable ["wr_interrupted", false]) exitWith {};

[] call FUNC(resetPlayerVars);

//check JIP player is spawning for the first time
_joinTime = player getVariable ["joinTime", 0];
if (serverTime - _joinTime < 30 && didJIP) exitWith {INFO("Player is JIP. Exiting onPlayerKilled.")};

["RESTRICTED"] call EFUNC(common,startSpectator);

INFO("Starting waverespawn procedure...");
[true] call FUNC(blockMap);
_timeOfDeath = time;
player setVariable ["wr_timeOfDeath",time];

//respawn player, put him in spec mode
setPlayerRespawnTime 5;
/* forceRespawn player; */
player allowDamage false;
[{alive player},{
    setPlayerRespawnTime 99999;
    player enableSimulation false;
    TF_max_voice_volume call TFAR_fnc_setVoiceVolume;
    [playerSide,player] remoteExec ["uo_waverespawn_fnc_addToWaitGroup",2,false];
},[]] call CBA_fnc_waitUntilAndExecute;

//do the steps
[_timeOfDeath] call FUNC(playerCountdown);
[{player getVariable "wr_playerCountdownDone"}, {_this call FUNC(waveCountdown)}, [_timeOfDeath]] call CBA_fnc_waitUntilAndExecute;
[{player getVariable "wr_waveCountdownDone"}, {[] call FUNC(prepareRespawn)}, []] call CBA_fnc_waitUntilAndExecute;
