#define PREFIX uo
#define COMPONENT choosePlayArea
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (isPlayer (missionNamespace getVariable ["opforcommander",objNull])) exitWith {};

CHOSENLOCATION = selectRandom (LOCATION_ALLVILLAGES + LOCATION_ALLCITIES + LOCATION_ALLCAPITALS + LOCATION_ALLOTHER);
uo_init_cityChosen = true;

publicVariable "CHOSENLOCATION";
publicVariable "uo_init_cityChosen";

INFO("No OPFOR commander. Location chosen randomly.");
