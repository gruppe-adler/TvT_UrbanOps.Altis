if (player getVariable "wr_interrupted") exitWith {player setVariable ["wr_waveCountdownDone", true]};
if (player getVariable "wr_isFreeRespawn") exitWith {player setVariable ["wr_waveCountdownDone", true]};

[profileName, player getVariable ["originalSide", "UNKNOWN"]] remoteExec ["mcd_fnc_addToWave",2,false];

[{
    private ["_explanation"];
    _timeOfDeath = (_this select 0) select 0;

    //check interrupt
    if (call (player getVariable "wr_interruptCondition")) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        player setVariable ["wr_interrupted", true];
        player setVariable ["wr_waveCountdownDone", true];
        diag_log "fn_waveWaveCountdown - Respawn interrupted.";
    };

    //check max respawn time
    if ((time - _timeOfDeath) > MAXRESPAWNTIME) then {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        player setVariable ["wr_isFreeRespawn", true];
        player setVariable ["wr_waveCountdownDone", true];
        diag_log "fn_waveWaveCountdown - Max respawn time reached.";
    };

    _respawnIn = parseText format ["<t align='center' size='1.4'>Spieler <t color='#00ff00'>bereit</t></t>"];
    _waveTimeLeft = call (player getVariable "wr_waveTimeLeft");
    _timeLeftStr = [_waveTimeLeft, "MM:SS"] call BIS_fnc_secondsToString;
    _playersLeft = call (player getVariable "wr_playersLeft");
    _waveSize = player getVariable "wr_waveSize";
    _waveLeft = parseText format ["<t align='center' size='1.4'>Welle: <t color='%3'>%1/%2</t> - <t color ='%4'>%5</t></t>", _waveSize - _playersLeft, _waveSize, if (_playersLeft == 0) then {"#00ff00"} else {"#ffff00"},if (_waveTimeLeft <= 0) then {"#00ff00"} else {"#ffff00"}, _timeLeftStr];
    if (_waveTimeLeft > 0) then {
        _explanation = parseText "<t align='center' size='1.4'>Warte auf Wellen-Countdown.</t>";
    } else {
        _explanation = parseText "<t align='center' size='1.4'>Warte auf weitere Spieler.</t>";
    };
    [_respawnIn, _waveLeft, _explanation] call mcd_fnc_respawnHint;

    if (_waveTimeLeft <= 0) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
    player setVariable ["wr_waveCountdownDone", true];
};

}, 1, _this] call CBA_fnc_addPerFrameHandler;