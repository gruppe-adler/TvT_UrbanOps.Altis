if (!hasInterface) exitWith {};

[true,"OPFOR IS CHOOSING CITY","PLEASE WAIT"] call uo_ui_fnc_twoLineHint;


[{!isNil "CITYPOSITION"}, {
    [{
        if (SETUPTIMEREMAINING <= 1) then {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
        [true, format ["SETUP TIME REMAINING: %1", ([SETUPTIMEREMAINING,"MM:SS"] call BIS_fnc_secondsToString)], "PLEASE WAIT"] call uo_ui_fnc_twoLineHint;
    } , 1, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;


_isCommander = false;
if (!isNil "bluforcommander") then {_isCommander = (player == bluforcommander)};
[{SETUPTIMEREMAINING <= 0}, {
    if (_this) then {
        [true,"CHOOSE SPAWN (LMOUSE)","CONFIRM (ENTER)"] call uo_ui_fnc_twoLineHint;
    } else {
        [true,"COMMANDER IS CHOOSING SPAWN","PLEASE WAIT"] call uo_ui_fnc_twoLineHint;
    };
}, _isCommander] call CBA_fnc_waitUntilAndExecute;
