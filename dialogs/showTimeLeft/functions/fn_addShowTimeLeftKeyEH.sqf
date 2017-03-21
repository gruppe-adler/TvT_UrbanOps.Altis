private _watchKeys = (actionKeys "Watch") + (actionKeys "WatchToggle");
_watchKeys = _watchKeys arrayIntersect _watchKeys;
{
    [_x, [false, false, false], {[{[] call uo_ui_fnc_onTimeLeftKeyDown}, []] call CBA_fnc_execNextFrame}, "KeyDown", "", false] call CBA_fnc_addKeyHandler;
    false
} count _watchKeys;
