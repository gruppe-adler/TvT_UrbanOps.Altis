#define PREFIX uo
#define COMPONENT choosePlayArea
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (isPlayer (missionNamespace getVariable ["bluforcommander",objNull])) exitWith {};

BLUFORSPAWN = CITYPOSITION getPos [BLUFORSTARTDIST, random 360];

uo_init_spawnChosen = true;
publicVariable "uo_init_spawnChosen";
publicVariable "BLUFORSPAWN";

INFO("No BLUFOR commander. Spawn chosen randomly.");
