#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_unit","_side"];

diag_log str _this;

switch (_side) do {
    case (WEST): {
        if (_unit in deadPlayersBlu) then {
            deadPlayersBlu deleteAt (([deadPlayersBlu,_unit] call BIS_fnc_arrayFindDeep) select 0);
            INFO_1("Player %1 respawned and has been removed from deadPlayersBlu.", name _unit);
        } else {
            ERROR_1("Player %1 is not in deadPlayersBlu.", name _unit);
        };
    };

    case (EAST): {
        if (_unit in deadPlayersOpf) then {
            deadPlayersOpf deleteAt (([deadPlayersOpf,_unit] call BIS_fnc_arrayFindDeep) select 0);
            INFO_1("Player %1 respawned and has been removed from deadPlayersOpf.", name _unit);
        } else {
            ERROR_1("Player %1 is not in deadPlayersOpf", name _unit);
        };
    };

    default {ERROR_1("Player %1 is neither WEST nor EAST.", name _unit)};
};

WAVERESPAWNPLAYERSLEFTBLU = BLUFORWAVESIZE - (count deadPlayersBlu);
WAVERESPAWNPLAYERSLEFTOPF = OPFORWAVESIZE - (count deadPlayersOpf);
publicVariable "WAVERESPAWNPLAYERSLEFTBLU";
publicVariable "WAVERESPAWNPLAYERSLEFTOPF";
