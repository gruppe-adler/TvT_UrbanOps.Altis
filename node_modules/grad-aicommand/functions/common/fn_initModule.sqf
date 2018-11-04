#include "script_component.hpp"

if (isNil QGVAR(canReceiveCommandsDefault)) then {
    GVAR(canReceiveCommandsDefault) = ([(missionConfigFile >> "CfgGradAICommand" >> "canReceiveCommandsDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;
};
if (isNil QGVAR(canGiveCommandsDefault)) then {
    GVAR(canGiveCommandsDefault) = ([(missionConfigFile >> "CfgGradAICommand" >> "canGiveCommandsDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;
};
if (isNil QGVAR(canUseHighcommandDefault)) then {
    GVAR(canUseHighcommandDefault) = ([(missionConfigFile >> "CfgGradAICommand" >> "canUseHighcommandDefault"),"number",0] call CBA_fnc_getConfigEntry) == 1;
};

if (hasInterface) then {
    _action = ["grad_aicommand_actionNode", "AI command", "\A3\ui_f\data\igui\cfg\simpleTasks\types\whiteboard_ca.paa", {[FUNC(openCommandWindow),_this] call CBA_fnc_execNextFrame}, {[group (_this select 0)] call FUNC(isEditableGroup)}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;

    /* _action = ["grad_aicommand_editCommandsAction", "Edit commands", "\A3\ui_f\data\igui\cfg\simpleTasks\types\use_ca.paa", {_this call FUNC(openCommandWindow)}, {_this call FUNC(canGiveCommands)}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions","grad_aicommand_actionNode"],_action,true] call ace_interact_menu_fnc_addActionToClass; */

    /* _action = ["grad_aicommand_executeCommandsAction", "Execute commands", "\A3\ui_f\data\igui\cfg\simpleTasks\types\run_ca.paa", {_this call FUNC(executeWaypoints)}, {_this call FUNC(canGiveCommands)}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions","grad_aicommand_actionNode"],_action,true] call ace_interact_menu_fnc_addActionToClass; */

    /* _action = ["grad_aicommand_joinGroupAction", "Join nearest group", "\A3\ui_f\data\igui\cfg\simpleTasks\types\getin_ca.paa", {_this call FUNC(joinNearestGroup)}, {_this call FUNC(canGiveCommands)}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions","grad_aicommand_actionNode"],_action,true] call ace_interact_menu_fnc_addActionToClass; */

    /* _action = ["grad_aicommand_leaveGroupAction", "Leave group", "\A3\ui_f\data\igui\cfg\simpleTasks\types\getout_ca.paa", {_this call FUNC(leaveGroup)}, {_this call FUNC(canGiveCommands)}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions","grad_aicommand_actionNode"],_action,true] call ace_interact_menu_fnc_addActionToClass; */

    _action = ["grad_aicommand_highcommandAction", "AI command", "\A3\ui_f\data\igui\cfg\simpleTasks\types\whiteboard_ca.paa", {[FUNC(openCommandWindow),_this] call CBA_fnc_execNextFrame}, {(_this select 1) getVariable [QGVAR(canUseHighcommand),GVAR(canUseHighcommandDefault)]}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",1,["ACE_SelfActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
