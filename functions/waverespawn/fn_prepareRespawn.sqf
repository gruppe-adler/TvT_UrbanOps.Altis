#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

INFO("Ready to respawn. Preparing...");

//respawn not possible
if (player getVariable ["wr_interrupted", false]) exitWith {
    private ["_explanation"];

    setPlayerRespawnTime 99999;

    _explanation = if (player getVariable ["originalSide", "UNKNOWN"] == "WEST") then {"Kommandofahrzeug zerstört!</t>"} else {"Dealer wurde getötet!"};
    _explanation = parseText format ["<t align='center' size='1.4'>%1</t>", _explanation];
    _respawnIn = parseText format ["<t align='center' size='1.4'>Respawn <t color='#cc0000'>nicht mehr verfügbar.</t></t>"];
    [_explanation, _respawnIn] call uo_waverespawn_fnc_respawnHint;

    [] call uo_common_fnc_startSpectator;
};


//respawn possible
_respawning = parseText format ["<t align='center' color='#00ff00' size='1.4'>Respawning...</t>"];
[_respawning] call uo_waverespawn_fnc_respawnHint;

_waitCondition = if (player getVariable "originalSide" == "WEST") then {{WAVERESPAWNBLU}} else {{WAVERESPAWNOPF}};
[{call (_this select 0)}, {
    [profileName, player getVariable ["originalSide", "UNKNOWN"]] remoteExec ["uo_waverespawn_fnc_removeFromWave",2,false];
    _availableOptions = if (player getVariable ["originalSide", "UNKNOWN"] == "WEST") then {count uo_cv_allCVs} else {1};
    if (_availableOptions > 1) then {[] call uo_chooseRespawn_fnc_choose} else {[] call uo_waverespawn_fnc_doRespawn};
}, [_waitCondition]] call CBA_fnc_waitUntilAndExecute;
