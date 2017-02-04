#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

private ["_pos"];

[player,playerSide] remoteExec ["uo_waverespawn_fnc_removeFromWave",2,false];

[false] call uo_waverespawn_fnc_blockMap;
["Terminate"] call BIS_fnc_EGSpectator;

[player, false] call TFAR_fnc_forceSpectator;
30 call TFAR_fnc_setVoiceVolume;

setPlayerRespawnTime 99999;
hint "";

[objNull] call uo_waverespawn_fnc_respawnSelectorMarker;
