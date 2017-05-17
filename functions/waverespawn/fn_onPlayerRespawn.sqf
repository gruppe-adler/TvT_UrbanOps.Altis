#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

private ["_pos"];

[player,playerSide] remoteExec ["uo_waverespawn_fnc_removeFromWave",2,false];

openMap [false, false];
[false] call uo_waverespawn_fnc_blockMap;
[false] call uo_ui_fnc_twoLineHint;
[false] call uo_sectors_fnc_drawSectors;
["Terminate"] call BIS_fnc_EGSpectator;

["mcd_chooseRespawn", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
(findDisplay 46) displayRemoveEventHandler ["KeyUp", missionNamespace getVariable ["mcd_onRespawnKeyDown",-1]];

[player, false] call TFAR_fnc_forceSpectator;
30 call TFAR_fnc_setVoiceVolume;

setPlayerRespawnTime 99999;
player enableSimulation true;
hint "";

[] call uo_waverespawn_fnc_resetPlayerVars;
[playerSide] call uo_waverespawn_fnc_respawnSelectorMarker;
