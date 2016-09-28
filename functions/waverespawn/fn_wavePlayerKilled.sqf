/*  handles player respawn
*
*   executed locally when player dies
*/

//check JIP player is spawning for the first time
_joinTime = player getVariable ["joinTime", 0];
_originalSide = player getVariable ["originalSide", "UNKNOWN"];
if (serverTime-joinTime < 30 && didJIP) exitWith {diag_log "fn_wavePlayerKilled - Player is JIP. Exiting..."};

[player, true] call TFAR_fnc_forceSpectator;
[true] call mcd_fnc_blockMap;
[player] joinSilent grpNull;
_timeOfDeath = time;

//keep player from respawning
setPlayerRespawnTime 9999;

//reset variables
player setVariable ["wr_playerRespawnTimeLeft", RESPAWNTIME];
player setVariable ["wr_interrupted", false];
player setVariable ["wr_isFreeRespawn", false];
player setVariable ["wr_playerCountdownDone", false];
player setVariable ["wr_waveCountdownDone", false];
player setVariable ["wr_cvCheckDone", false];


//do the steps
[_timeOfDeath] call mcd_fnc_wavePlayerCountdown;
[{player getVariable "wr_playerCountdownDone"}, {[_this] call mcd_fnc_waveWaveCountdown}, [_timeOfDeath]] call CBA_fnc_waitUntilAndExecute;
[{player getVariable "wr_waveCountdownDone"}, {[] call mcd_fnc_waveCvCheck}, []] call CBA_fnc_waitUntilAndExecute;
[{player getVariable "wr_cvCheckDone"}, {[] call mcd_fnc_respawnPlayer}, []] call CBA_fnc_waitUntilAndExecute;
