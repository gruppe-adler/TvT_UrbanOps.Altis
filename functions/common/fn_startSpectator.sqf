params [["_mode","NORMAL"]];

if (_mode == "NORMAL") then {
    ["Terminate"] call BIS_fnc_EGSpectator;
    ["Initialize", [player, [WEST,EAST,INDEPENDENT], true]] call BIS_fnc_EGSpectator;
};

if (_mode == "RESTRICTED") then {
    ["Terminate"] call BIS_fnc_EGSpectator;
    ["Initialize", [player, [playerside], false, false, false, true, true, true, true, true]] call BIS_fnc_EGSpectator;
};
