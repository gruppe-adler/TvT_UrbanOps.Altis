params ["_side","_accuracy",["_mode","UNITS"]];
private ["_enemies","_markerType"];

if (typeName _accuracy == "ARRAY") then {_accuracy = (random ((_accuracy select 1)-(_accuracy select 0))) + (_accuracy select 0)};

switch (true) do {
    //mark unit
    case (_mode == "UNITS"): {
        _enemies = playableUnits select {alive _x && (side _x == _side) && (_x distance CITYPOSITION) < CITYAREASIZE*1.5};
        _markerType = if (_side == east) then {"o_inf"} else {"b_inf"};
    };

    //mark dealer
    case (_mode == "RESPAWNOBJECT" && _side == EAST): {
        _enemies = [uo_DEALER];
        _markerType = "o_hq";
    };

    //mark commandvehicle
    case (_mode == "RESPAWNOBJECT" && _side == WEST): {
        _enemies = missionNamespace getVariable ["uo_cv_allCVs", []];
        _markerType = "b_hq";
    };
};

if (count _enemies > 0) then {
    _enemyUnit = selectRandom _enemies;
    if (!isNull _enemyUnit) then {
        [_side,_enemyUnit,_accuracy,_markerType] remoteExec ['uo_civs_fnc_createEnemyMarker',0,false];
    };
};
