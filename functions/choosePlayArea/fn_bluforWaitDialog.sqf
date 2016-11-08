if (!hasInterface) exitWith {};

mcd_fnc_waitDialogText = {((_this select 0) displayCtrl 1401) ctrlSetText format ["TIME REMAINING: %1", ([SETUPTIMEREMAINING,"MM:SS"] call BIS_fnc_secondsToString)]};

titleRsc ["bluforWaitMessage1", "PLAIN", 1, true];

[{!isNil "CITYPOSITION"}, {
    [{
        if (SETUPTIMEREMAINING <= 1) then {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
        titleRsc ["bluforWaitMessage2", "PLAIN", 0.0001, true];
    } , 1, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

_isCommander = false;
if (!isNil "bluforcommander") then {_isCommander = (player == bluforcommander)};
[{SETUPTIMEREMAINING <= 0}, {
    if (_this) then {
        titleRsc ["chooseSpawnGUI", "PLAIN", 1, true];
    } else {
        titleRsc ["bluforWaitMessage3", "PLAIN", 1, true];
    };
}, _isCommander] call CBA_fnc_waitUntilAndExecute;
