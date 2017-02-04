#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_deadPlayer", ["_deadPlayerSide", sideUnknown]];

if (isNil "deadPlayersBlu") then {deadPlayersBlu = []};
if (isNil "deadPlayersOpf") then {deadPlayersOpf = []};

//add player to array
switch (_deadPlayerSide) do {
    case (WEST): {
        deadPlayersBlu pushBackUnique _deadPlayer;
        INFO_2("Added player %1 to deadPlayersBlu. %2 dead blufor total.", _deadPlayer, count deadPlayersBlu);
    };
    case (EAST): {
        deadPlayersOpf pushBackUnique _deadPlayer;
        INFO_2("Added player %1 to deadPlayersOpf. %2 dead opfor total.", _deadPlayer, count deadPlayersOpf);
    };
    default {
        ERROR_1("Unknown side for player %1", _deadPlayer);
    };
};

WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE - (count deadPlayersBlu);
WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE - (count deadPlayersOpf);
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
