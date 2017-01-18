#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_timeOfDeath"];

[{
    _timeOfDeath = (_this select 0) select 0;

    //check interrupt
    if (player getVariable "wr_interrupted") exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        player setVariable ["wr_playerCountdownDone", true];
    };

    if (call (player getVariable "wr_interruptCondition")) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        player setVariable ["wr_interrupted", true];
        player setVariable ["wr_playerCountdownDone", true];
        INFO("Respawn interrupted.");
    };

    if (time - _timeOfDeath > MAXRESPAWNTIME) then {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        player setVariable ["wr_isFreeRespawn", true];
        player setVariable ["wr_playerCountdownDone", true];
        INFO("Max respawn time reached.");
    };

    player setVariable ["wr_playerRespawnTimeLeft", (player getVariable "wr_playerRespawnTimeLeft") - 1];
    _playerTimeLeft = player getVariable "wr_playerRespawnTimeLeft";
    _timeleftStr = [_playerTimeLeft, "MM:SS"] call BIS_fnc_secondsToString;
    _respawnIn = parseText format ["<t align='center' size='1.4'>Spieler: <t color='#ffff00'>%1</t></t>", _timeleftStr];

    _waveTimeLeft = call (player getVariable "wr_waveTimeLeft");
    _timeLeftStr = [_waveTimeLeft, "MM:SS"] call BIS_fnc_secondsToString;
    _playersLeft = call (player getVariable "wr_playersLeft");
    _waveSize = player getVariable "wr_waveSize";
    _waveLeft = parseText format ["<t align='center' size='1.4'>Welle: <t color='%3'>%1/%2</t> - <t color ='%4'>%5</t></t>", _waveSize - _playersLeft, _waveSize, if (_playersLeft == 0) then {"#00ff00"} else {"#ffff00"},if (_waveTimeLeft <= 0) then {"#00ff00"} else {"#ffff00"}, _timeLeftStr];

    _explanation = parseText "<t align ='center' size='1.4'>Warte auf Spieler-Countdown.</t>";
    [_respawnIn, _waveLeft, _explanation] call uo_waverespawn_fnc_respawnHint;

    if (_playerTimeLeft <= 0) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        player setVariable ["wr_playerCountdownDone", true];
    };
}, 1, [_timeOfDeath]] call CBA_fnc_addPerFrameHandler;
