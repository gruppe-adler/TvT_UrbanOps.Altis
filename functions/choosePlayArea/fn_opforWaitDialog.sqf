if (!hasInterface) exitWith {};

if ([player] call uo_common_fnc_isCommander) then {
    [true,"CHOOSE PLAYZONE (LMOUSE)","CONFIRM (ENTER)"] call uo_ui_fnc_twoLineHint;
} else {
    if (side player == EAST) then {
        [true,"COMMANDER IS CHOOSING CITY","PLEASE WAIT"] call uo_ui_fnc_twoLineHint;
    } else {
        [true,"OPFOR IS CHOOSING CITY","PLEASE WAIT"] call uo_ui_fnc_twoLineHint;
    };
};
