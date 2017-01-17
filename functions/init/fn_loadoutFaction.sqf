#define PREFIX uo
#define COMPONENT init
#include "\x\cba\addons\main\script_macros_mission.hpp"


_terrainClass = if (uo_missionParam_ISWOODLAND) then {"loadoutWood"} else {"loadoutDes"};
_blufor = getText (missionConfigFile >> "cfgFactions" >> uo_missionParam_BLUFORFACTION >> _terrainClass);
_opfor = getText (missionConfigFile >> "cfgFactions" >> uo_missionParam_OPFORFACTION >> _terrainClass);

["BLU_F", _blufor] call GRAD_Loadout_fnc_FactionSetLoadout;
["OPF_F", _opfor] call GRAD_Loadout_fnc_FactionSetLoadout;

INFO_1("Blufor faction is %1.", _blufor);
INFO_1("Opfor faction is %1.", _opfor);
