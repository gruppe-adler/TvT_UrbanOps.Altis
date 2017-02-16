grad_aicommand_canReceiveCommandsDefault = ([(missionConfigFile >> "CfgGradAICommand" >> "canReceiveCommandsDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;
grad_aicommand_canGiveCommandsDefault = ([(missionConfigFile >> "CfgGradAICommand" >> "canGiveCommandsDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;

if (hasInterface) then {
    _action = ["grad_aicommand_actionNode", "AI command", "\A3\ui_f\data\igui\cfg\simpleTasks\types\whiteboard_ca.paa", {}, {true}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;

    _action = ["grad_aicommand_mainAction", "Edit commands", "\A3\ui_f\data\igui\cfg\simpleTasks\types\use_ca.paa", {_this call grad_aicommand_fnc_openCommandWindow}, {_this call grad_aicommand_fnc_canGiveCommands}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions","grad_aicommand_actionNode"],_action,true] call ace_interact_menu_fnc_addActionToClass;

    _action = ["grad_aicommand_mainAction", "Execute commands", "\A3\ui_f\data\igui\cfg\simpleTasks\types\run_ca.paa", {_this call grad_aicommand_fnc_executeWaypoints}, {_this call grad_aicommand_fnc_canGiveCommands}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions","grad_aicommand_actionNode"],_action,true] call ace_interact_menu_fnc_addActionToClass;

    _action = ["grad_aicommand_mainAction", "Join nearest group", "\A3\ui_f\data\igui\cfg\simpleTasks\types\getin_ca.paa", {_this call grad_aicommand_fnc_joinNearestGroup}, {_this call grad_aicommand_fnc_canGiveCommands}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions","grad_aicommand_actionNode"],_action,true] call ace_interact_menu_fnc_addActionToClass;

    _action = ["grad_aicommand_mainAction", "Leave group", "\A3\ui_f\data\igui\cfg\simpleTasks\types\getout_ca.paa", {_this call grad_aicommand_fnc_leaveGroup}, {_this call grad_aicommand_fnc_canGiveCommands}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions","grad_aicommand_actionNode"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
