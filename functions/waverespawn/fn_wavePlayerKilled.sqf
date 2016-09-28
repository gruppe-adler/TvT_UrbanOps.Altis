/*  handles player respawn
*
*   executed locally when player dies
*/

private ["_waitCondition", "_interruptCondition", "_playersLeft", "_waveTimeLeft", "_waveLeft","_minutes","_seconds","_respawnIn", "_explanation"];

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
sleep 2;


//declare/define variables =====================================================
_rule = parseText "<t align='center'><t color='#708090'>-----------------------------------------------------<br /></t></t>";
_lineBreak = parseText "<br />";

player setVariable ["playerRespawnTimeLeft", RESPAWNTIME];
[{
  //check interrupt
  if (call _interruptCondition) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
    _interrupted = true;
    diag_log "fn_wavePlayerKilled - Respawn interrupted.";
  };

  player setVariable ["playerRespawnTimeLeft", (player getVariable ["playerRespawnTimeLeft"]) - 1];

}, 1, []] call CBA_fnc_addPerFrameHandler;
if (_interrupted) exitWith {call mcd_fnc_startSpectator};

















//respawn countdown ============================================================
while {_timeleft > 0} do {
  if (call _interruptCondition) exitWith {diag_log "onPlayerKilled.sqf - Respawn interrupted."; _interrupted = true};

  //countdown
  _timeleft = _timeleft - 1;
  _minutes = str (floor (_timeleft/60));
  _seconds = floor (_timeleft mod 60);
  if (_seconds<10) then {_seconds = "0" + str _seconds} else {_seconds = str _seconds};
  _respawnIn = parseText format ["<t align='center' size='1.4'>Spieler: <t color='#ffff00'>%1:%2</t></t>", _minutes, _seconds];

  //wave
  _minutes = str (floor (call _waveTimeLeft/60));
  _seconds = floor (call _waveTimeLeft mod 60);
  if (_seconds<10) then {_seconds = "0" + str _seconds} else {_seconds = str _seconds};
  _waveTimeStr = format ["%1:%2", _minutes, _seconds];
  _waveLeft = parseText format ["<t align='center' size='1.4'>Welle: <t color='%3'>%1/%2</t> - <t color ='%4'>%5</t></t>", _waveSize -(call _playersLeft), _waveSize, if (call _playersLeft == 0) then {"#00ff00"} else {"#ffff00"},if (call _waveTimeLeft <= 0) then {"#00ff00"} else {"#ffff00"},_waveTimeStr];

  //explanation
  _explanation = parseText "<t align ='center' size='1.4'>Warte auf Spieler-Countdown.</t>";

  //compose hint
  hint composeText [_rule, _respawnIn, _lineBreak, _waveLeft, _lineBreak, _explanation, _lineBreak, _rule];

  sleep 1;
};

if (_interrupted) exitWith {call mcd_fnc_startSpectator};
