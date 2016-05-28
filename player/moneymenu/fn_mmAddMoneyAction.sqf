params ["_unit"];

_action = ["mcd_givemoney", "Give Money (Amount)", "data\moneyIcon.paa", {[_this select 0] execVM "player\moneymenu\loadMoneymenu.sqf"}, {true}] call ace_interact_menu_fnc_createAction;
[_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;


_action = ["mcd_givemoney", "Give Money (All)", "data\moneyIcon.paa", {[_this select 0, "all"] call mcd_fnc_mmSendMoney}, {true}] call ace_interact_menu_fnc_createAction;
[_unit, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
