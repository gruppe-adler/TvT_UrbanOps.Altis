#define PREFIX uo
#define COMPONENT civs
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (isServer) then {

    _islandType = ["type"] call uo_common_fnc_getIslandCfgValue;
    _civConfig = (missionConfigFile >> "cfgCivilians");
    switch (true) do {
        case (_islandType == "russian" && isClass (configFile >> "CfgPatches" >> "rds_A2_Civilians")): {
            uo_civs_Units = [(_civConfig >>  "russian" >> "units"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_uniforms = [(_civConfig >>  "russian" >> "uniforms"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_headgear = [(_civConfig >>  "russian" >> "headgear"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_goggles = [(_civConfig >>  "russian" >> "goggles"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_vehicles = [(_civConfig >>  "russian" >> "vehicles"), "array", []] call CBA_fnc_getConfigEntry;

            INFO("Equipping civilians with Russian gear.");
        };

        case (_islandType == "middle eastern" && isClass (configfile >> "CfgPatches" >> "lop_main")): {
            uo_civs_Units = [(_civConfig >>  "middleEastern" >> "units"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_uniforms = [(_civConfig >>  "middleEastern" >> "uniforms"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_headgear = [(_civConfig >>  "middleEastern" >> "headgear"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_goggles = [(_civConfig >>  "middleEastern" >> "goggles"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_vehicles = [(_civConfig >>  "middleEastern" >> "vehicles"), "array", []] call CBA_fnc_getConfigEntry;
            if (isClass (configFile >> "CfgPatches" >> "rds_A2_Civilians")) then {
                uo_civs_vehicles = uo_civs_vehicles + ([(_civConfig >>  "russian" >> "vehicles"), "array", []] call CBA_fnc_getConfigEntry);
            } else {
                uo_civs_vehicles = uo_civs_vehicles + ([(_civConfig >>  "mediterranean" >> "vehicles"), "array", []] call CBA_fnc_getConfigEntry);
            };
            INFO("Equipping civilians with middle eastern gear.");
        };

        case (_islandType == "tropic" && isClass (configfile >> "CfgPatches" >> "A3_Modules_F_Exp")): {
            uo_civs_Units = [(_civConfig >>  "tropic" >> "units"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_uniforms = [(_civConfig >>  "tropic" >> "uniforms"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_headgear = [(_civConfig >>  "tropic" >> "headgear"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_goggles = [(_civConfig >>  "tropic" >> "goggles"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_vehicles = [(_civConfig >>  "tropic" >> "vehicles"), "array", []] call CBA_fnc_getConfigEntry;

            INFO("Equipping civilians with tropic gear.");
        };

        default {
            uo_civs_Units = [(_civConfig >>  "mediterranean" >> "units"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_uniforms = [(_civConfig >>  "mediterranean" >> "uniforms"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_headgear = [(_civConfig >>  "mediterranean" >> "headgear"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_goggles = [(_civConfig >>  "mediterranean" >> "goggles"), "array", []] call CBA_fnc_getConfigEntry;
            uo_civs_vehicles = [(_civConfig >>  "mediterranean" >> "vehicles"), "array", []] call CBA_fnc_getConfigEntry;

            INFO("Equipping civilians with mediterranean gear.");
        };
    };

    _houses = [CITYPOSITION,CITYAREASIZE+80] call uo_common_fnc_findBuildings;
    INFO_1("%1 houses found for civs.", count _houses);
    [_houses] call uo_civs_fnc_createSideRoadVehicles;
    [_houses] call uo_civs_fnc_createGarageVehicles;
    [_houses] call uo_missionObjectives_fnc_createDealer;
    [_houses] call uo_civs_fnc_createCivs;

};

if (hasInterface) then {
    _action = ["uo_civs_surrenderAction", "Hands up!", "", {[_this select 0,_this select 1] remoteExec ["uo_civs_fnc_doSurrender",2,false]}, {
        side (_this select 0) == CIVILIAN && alive (_this select 0) && !isPlayer (_this select 0) && {!((_this select 0) getVariable ["ace_captives_isHandcuffed",false]) && !((_this select 0) getVariable ["ace_captives_isSurrendering",false])}
    }] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
