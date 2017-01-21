#define PREFIX uo
#define COMPONENT civs
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (isServer) then {

    _islandType = ["type"] call uo_common_fnc_getIslandCfgValue;
    switch (true) do {
        case (_islandType == "russian" && isClass (configFile >> "CfgPatches" >> "rds_A2_Civilians")): {
            uo_civs_Units = [(missionConfigFile >> "cfgCivilians" >>  "russian" >> "units"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_uniforms = [(missionConfigFile >> "cfgCivilians" >>  "russian" >> "uniforms"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_headgear = [(missionConfigFile >> "cfgCivilians" >>  "russian" >> "headgear"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_goggles = [(missionConfigFile >> "cfgCivilians" >>  "russian" >> "goggles"), "array", []] call CBA_fnc_getConfigEntry;

            INFO("Equipping civilians with Russian gear.");
        };

        case (_islandType == "middle eastern" && isClass (configfile >> "CfgPatches" >> "lop_main")): {
            uo_civs_Units = [(missionConfigFile >> "cfgCivilians" >>  "middleEastern" >> "units"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_uniforms = [(missionConfigFile >> "cfgCivilians" >>  "middleEastern" >> "uniforms"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_headgear = [(missionConfigFile >> "cfgCivilians" >>  "middleEastern" >> "headgear"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_goggles = [(missionConfigFile >> "cfgCivilians" >>  "middleEastern" >> "goggles"), "array", []] call CBA_fnc_getConfigEntry;

            INFO("Equipping civilians with middle eastern gear.");
        };

        case (_islandType == "tropic" && isClass (configfile >> "CfgPatches" >> "A3_Modules_F_Exp")): {
            uo_civs_Units = [(missionConfigFile >> "cfgCivilians" >>  "tropic" >> "units"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_uniforms = [(missionConfigFile >> "cfgCivilians" >>  "tropic" >> "uniforms"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_headgear = [(missionConfigFile >> "cfgCivilians" >>  "tropic" >> "headgear"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_goggles = [(missionConfigFile >> "cfgCivilians" >>  "tropic" >> "goggles"), "array", []] call CBA_fnc_getConfigEntry;

            INFO("Equipping civilians with tropic gear.");
        };

        default {
            uo_civs_Units = [(missionConfigFile >> "cfgCivilians" >>  "mediterranean" >> "units"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_uniforms = [(missionConfigFile >> "cfgCivilians" >>  "mediterranean" >> "uniforms"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_headgear = [(missionConfigFile >> "cfgCivilians" >>  "mediterranean" >> "headgear"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_goggles = [(missionConfigFile >> "cfgCivilians" >>  "mediterranean" >> "goggles"), "array", []] call CBA_fnc_getConfigEntry;

            INFO("Equipping civilians with mediterranean gear.");
        };
    };

    _houses = [] call uo_civs_fnc_findHouses;
    [_houses] call uo_missionObjectives_fnc_createDealer;
    [_houses] call uo_civs_fnc_createCivs;
};

if (hasInterface) then {
    _action = ["uo_civs_surrenderAction", "Hands up!", "", {[_this select 0,_this select 1] remoteExec ["uo_civs_fnc_doSurrender",2,false]}, {
        side (_this select 0) == CIVILIAN && alive (_this select 0) && !isPlayer (_this select 0) && {!((_this select 0) getVariable ["ace_captives_isHandcuffed",false]) && !((_this select 0) getVariable ["ace_captives_isSurrendering",false])}
    }] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
