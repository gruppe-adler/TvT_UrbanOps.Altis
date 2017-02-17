[{
    params ["_args","_handle"];
    _args params ["_unit","_target"];

    _unit doMove (getPos _target);

    if (!alive _unit || isNull _unit) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    if (!alive _target || isNull _target || (_unit knowsAbout _target) == 0) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        [_unit] call uo_buyables_fnc_initSuicideBomber;
    };

    if (_unit distance2D _target < 15 && {!(_unit getVariable ["ACE_isUnconscious",false])}) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        [_unit] call uo_buyables_fnc_suicideBomberExplode;
    };
} , 2, _this] call CBA_fnc_addPerFrameHandler;
