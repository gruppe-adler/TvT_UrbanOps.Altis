if (!isServer) exitWith {};

params ["_cv"];

_h = [{
    (_this select 0) params ["_cv","_inner", "_outer", "_enemyRadius"];
    private ["_cvactive"];

    //cv is gone
    if (isNull _cv || !alive _cv) exitWith {
        _cv setVariable ["uo_respawnObject_isActive", false, true];
        missionNamespace setVariable ["uo_cv_allCVs", (missionNamespace getVariable ["uo_cv_allCVs", []]) - [_cv], true];
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    //get distance
    _dist = CITYPOSITION distance2D _cv;

    //check if enemies near


    _cvactive = switch (true) do {
        case (_dist < _inner): {false};
        case (_dist > _outer): {false};
        case (speed _cv > 2): {false};
        default {true}
    };

    _current = _cv getVariable ["uo_respawnObject_isActive", false];
    if ((_cvactive && !_current) || (!_cvactive && _current)) then {
        _cv setVariable ["uo_respawnObject_isActive", _cvactive, true];
        diag_log format ["fn_checkCommandVehicle - Command Vehicle %1 is now %2.", _cv, if (_cvactive) then {"active"} else {"inactive"}];
    };
} , 1, [_cv, BLUFORSPAWNDIST, BLUFORSPAWNDIST+BLUFORSPAWNBAND, CVENEMYRADIUS]] call CBA_fnc_addPerFrameHandler;

diag_log format ["fn_checkCommandVehicle - Loop created. Handle: %1.", _h];
