#include "script_component.hpp"

INFO("Ready to respawn. Preparing...");

//respawn not possible
if (player getVariable ["wr_interrupted", false]) exitWith {

    player allowDamage true;
    setPlayerRespawnTime 99999;
    player setDamage 1;
    [player, true] call TFAR_fnc_forceSpectator;
    [] call uo_common_fnc_startSpectator;

    _explanation = switch (true) do {
        case (playerSide == WEST && !uo_missionParam_BLUFORRESPAWNENABLED): {"Respawn disabled."};
        case (playerSide == WEST): {"Commandvehicle destroyed!"};
        case (!uo_missionParam_OPFORRESPAWNENABLED): {"Respawn disabled."};
        default {"Dealer was killed!"};
    };
    _explanation = parseText format ["<t align='center' size='1.4'>%1</t>", _explanation];
    [playerSide, _explanation] call FUNC(respawnHint);
    [{hint ""}, [], 3] call CBA_fnc_waitAndExecute;
};

if (player getVariable ["wr_isFreeRespawn", false]) exitWith {

};
