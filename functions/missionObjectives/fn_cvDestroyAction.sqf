params ["_cv"];

if (!hasInterface) exitWith {};
if (isNil "_cv") exitWith {};
if (isNull _cv) exitWith {};


_action = ["uo_cv_destroyAction","Destroy vehicle","",{
    params ["_cv","_caller"];

    [_caller,(configFile >> "ACE_Repair" >> "Actions" >> "MiscRepair")] call uo_common_fnc_doAnimation;

    _onComplete = {
        _args = _this select 0;
        _args params ["_cv","_caller"];
        _cv setHitPointDamage ["HitEngine", 1];
        [_caller] call uo_common_fnc_stopAnimation;
    };

    _onCancel = {
        _args = _this select 0;
        _args params ["_cv","_caller"];
        [_caller] call uo_common_fnc_stopAnimation;
    };

    [15, [_cv,_caller], _onComplete, _onCancel, "Destroying vehicle..."] call ace_common_fnc_progressBar;

},{side (_this select 1) == EAST && !((_this select 0) getVariable ["uo_respawnObject_isDestroyed",false])}] call ace_interact_menu_fnc_createAction;
[_cv,0,["ACE_MainActions"],_action] call ace_interact_menu_fnc_addActionToObject;
