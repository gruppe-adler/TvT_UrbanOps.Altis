params ["_tower","_caller"];


[_unit,(configFile >> "ACE_Repair" >> "Actions" >> "FullRepair")] call grad_fortifications_fnc_doAnimation;


_onComplete = {
    _args = _this select 0;
    _args params ["_tower","_unit"];

    [_unit] call grad_fortifications_fnc_stopAnimation;
    _tower setVariable ["uo_propagandaTower_isDestroyed",true,true];
    _tower setVariable ["uo_propagandaTower_isPlaying",false,true];

    if (!alive _tower) exitWith {};

    [_tower] call uo_buyables_fnc_propagandaTowerDestroyedEffect;
    [_tower,_caller,[false]] remoteExec ["uo_buyables_fnc_propagandaTowerSetActive",2,false];
};


_onCancel = {
    _args = _this select 0;
    _args params ["_tower","_unit"];

    [_unit] call grad_fortifications_fnc_stopAnimation;
};


[25, [_tower,_caller], _onComplete, _onCancel, "Destroying..."] call ace_common_fnc_progressBar;
