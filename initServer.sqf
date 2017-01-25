if ("Preset" call BIS_fnc_getParamValue == 1) then {
    CHOSENLOCATION = nearestLocation [[13991.4,18699.7,0], "NameCity"];
    publicVariable "CHOSENLOCATION";
    uo_init_cityChosen = true;
    publicVariable "uo_init_cityChosen";
};

["uo_handleJIP", "onPlayerConnected", {
    _this call uo_common_fnc_handleJIP;
}] call BIS_fnc_addStackedEventHandler;

["Initialize", [true]] call BIS_fnc_dynamicGroups;

[] execVM "tfarsettings.sqf";
