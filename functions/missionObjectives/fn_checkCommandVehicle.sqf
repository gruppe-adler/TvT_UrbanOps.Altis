if (!isServer) exitWith {};

params ["_cv"];

_h = [{
    (_this select 0) params ["_cv","_inner", "_outer", "_enemyRadius"];
    private ["_cvactive"];

    //cv is destroyed
    if ((isNull _cv || !alive _cv) || {_cv gethitPointDamage "HitEngine" == 1}) exitWith {
        _cv setVariable ["uo_respawnObject_isActive", false, true];
        _cv setVariable ["uo_respawnObject_isDestroyed", true, true];
        missionNamespace setVariable ["uo_cv_allCVs", (missionNamespace getVariable ["uo_cv_allCVs", []]) - [_cv], true];

        [[EAST,WEST,CIVILIAN],'Report','A commandvehicle has been destroyed.'] remoteExec ['uo_fnc_sideNotification',0,false];

        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    //get distance
    _dist = CITYPOSITION distance2D _cv;


    _cvactive = switch (true) do {
        case (_dist < _inner): {false};
        case (_dist > _outer): {false};
        case (speed _cv > 2): {false};
        case ({alive _x && side _x == east} count (nearestObjects [_cv, ["Man"], CVENEMYRADIUS]) > 0): {false};
        default {true}
    };

    _current = _cv getVariable ["uo_respawnObject_isActive", false];
    if ((_cvactive && !_current) || (!_cvactive && _current)) then {
        _cv setVariable ["uo_respawnObject_isActive", _cvactive, true];
        diag_log format ["fn_checkCommandVehicle - Command Vehicle %1 is now %2.", _cv, if (_cvactive) then {"active"} else {"inactive"}];
    };
} , 2, [_cv, BLUFORSPAWNDIST, BLUFORSPAWNDIST+BLUFORSPAWNBAND, CVENEMYRADIUS]] call CBA_fnc_addPerFrameHandler;

diag_log format ["fn_checkCommandVehicle - Loop created. Handle: %1.", _h];
