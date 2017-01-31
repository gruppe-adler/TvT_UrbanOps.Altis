/*    handles player respawn
*
*     executed locally when player dies
*/

#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

//check JIP player is spawning for the first time
_joinTime = player getVariable ["joinTime", 0];
_originalSide = player getVariable ["originalSide", "UNKNOWN"];
if (serverTime - _joinTime < 30 && didJIP) exitWith {INFO("Player is JIP. Exiting onPlayerKilled.")};

INFO("Starting waverespawn procedure...");
[true] call uo_waverespawn_fnc_blockMap
_timeOfDeath = time;


//keep player from respawning
setPlayerRespawnTime 9999;


//reset variables
player setVariable ["wr_playerRespawnTimeLeft", uo_missionParam_RESPAWNTIME];
player setVariable ["wr_interrupted", false];
player setVariable ["wr_isFreeRespawn", false];
player setVariable ["wr_playerCountdownDone", false];
player setVariable ["wr_waveCountdownDone", false];
player setVariable ["wr_cvCheckDone", false];


//do the steps
[_timeOfDeath] call uo_waverespawn_fnc_playerCountdown;
[{player getVariable "wr_playerCountdownDone"}, {_this call uo_waverespawn_fnc_waveCountdown}, [_timeOfDeath]] call CBA_fnc_waitUntilAndExecute;
[{player getVariable "wr_waveCountdownDone"}, {[] call uo_waverespawn_fnc_cvCheck}, []] call CBA_fnc_waitUntilAndExecute;
[{player getVariable "wr_cvCheckDone"}, {[] call uo_waverespawn_fnc_prepareRespawn}, []] call CBA_fnc_waitUntilAndExecute;
