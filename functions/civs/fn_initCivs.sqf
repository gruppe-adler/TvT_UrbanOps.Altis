if (isServer) then {
    _houses = [] call uo_fnc_findHouses;
    [_houses] call uo_fnc_spawnDealer;
    [_houses] call uo_fnc_createCivs;
};

if (hasInterface) then {
    _action = ["uo_civs_surrenderAction", "Hands up!", "", {[_this select 0,_this select 1] remoteExec ["uo_fnc_civDoSurrender",2,false]}, {[_this select 0] call ace_captives_fnc_canSurrender}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
