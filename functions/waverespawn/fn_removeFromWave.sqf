#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

params [["_respawnedPlayerName", ""], ["_respawnedSide", "UNKNOWN"], ["_respawnedUnit", objNull]];

switch (_respawnedSide) do {
    case "WEST": {
        if (_respawnedPlayerName in deadPlayersBlu) then {
            deadPlayersBlu = deadPlayersBlu - [_respawnedPlayerName];
            INFO_1("Player %1 respawned and has been removed from deadPlayersBlu.", _respawnedPlayerName);
        } else {
            ERROR_1("Player %1 is not in deadPlayersBlu.", _respawnedPlayerName);
        };
    };

    case "EAST": {
        if (_respawnedPlayerName in deadPlayersOpf) then {
            deadPlayersOpf = deadPlayersOpf - [_respawnedPlayerName];
            INFO_1("Player %1 respawned and has been removed from deadPlayersOpf.", _respawnedPlayerName);
        } else {
            ERROR_1("Player %1 is not in deadPlayersOpf", _respawnedPlayerName);
        };
    };

    case "UNKNOWN": {
        INFO_1("Player %1 has unknown side.",_respawnedPlayerName);

        if (_respawnedPlayerName in deadPlayersBlu) then {
            deadPlayersBlu = deadPlayersBlu - [_respawnedPlayerName];
            [_respawnedUnit, "WEST"] call uo_waverespawn_fnc_addRespawnedToGroup;
            INFO_1("Player %1 disconnected and has been removed from deadPlayersBlu", _respawnedPlayerName);
        } else {
            if (_respawnedPlayerName in deadPlayersOpf) then {
                deadPlayersOpf = deadPlayersOpf - [_respawnedPlayerName];
                [_respawnedUnit, "EAST"] call uo_waverespawn_fnc_addRespawnedToGroup;
                INFO_1("Player %1 disconnected and has been removed from deadPlayersOpf", _respawnedPlayerName);
            } else {
                INFO_1("Player %1 disconnected but was not waiting for respawn", _respawnedPlayerName);
            };
        };
    };

    default {ERROR_1("Player %1 is neither WEST nor EAST nor UNKNOWN", _respawnedPlayerName)};
};

[_respawnedUnit, _respawnedSide] call uo_waverespawn_fnc_addRespawnedToGroup;

[
    {
        WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE - (count deadPlayersBlu);
        WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE - (count deadPlayersOpf);
        publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
        publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
    }, [], RESPAWNWAVEEXTRATIME
] call CBA_fnc_waitAndExecute;
