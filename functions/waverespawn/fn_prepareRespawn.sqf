#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

INFO("Ready to respawn. Preparing...");

//respawn not possible
if (player getVariable ["wr_interrupted", false]) exitWith {

    player allowDamage true;
    player setDamage 1;
    setPlayerRespawnTime 99999;
    [player, true] call TFAR_fnc_forceSpectator;
    [] call uo_common_fnc_startSpectator;

    _explanation = if (player getVariable ["originalSide", "UNKNOWN"] == "WEST") then {"Commandvehicle destroyed!</t>"} else {"Dealer was killed!"};
    _explanation = parseText format ["<t align='center' size='1.4'>%1</t>", _explanation];
    [playerSide, _explanation] call uo_waverespawn_fnc_respawnHint;
};

if (player getVariable ["wr_isFreeRespawn", false]) exitWith {

};
