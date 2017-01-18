#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

private ["_pos"];

[false] call uo_waverespawn_fnc_blockMap;
_originalSide = player getVariable ["originalSide", "UNKNOWN"];
if (_originalSide == "WEST" && count uo_cv_allCVs == 0) exitWith {ERROR("Player respawned but there are no commandvehicles"};

//teleport to commandvehicle
if (_originalSide == "WEST") then {
    _respawnObject = missionNamespace getVariable ["uo_selectedRespawnObject", uo_cv_allCVs select 0];
    _pos = (getPos _respawnObject) findEmptyPosition [1, 30];
    [player, _pos] call uo_common_fnc_teleport;
};

//teleport to city
if (_originalSide == "EAST") then {
    _pos = [] call uo_missionstart_fnc_findOpfSpawnPos;
    [player, _pos] call uo_common_fnc_teleport;
};

if (_originalSide == "UNKNOWN") then {
    ["onPlayerRespawn.sqf - ERROR: PLAYER %1 HAS UNKNOWN SIDE.", profileName] call uo_common_fnc_serverLog;
};

//check JIP player is spawning for the first time
if (serverTime - (player getVariable ["joinTime", 0]) < 30 && didJIP) exitWith {};

//remove hint
hint "";

//re-set respawn time
setPlayerRespawnTime 99999;
