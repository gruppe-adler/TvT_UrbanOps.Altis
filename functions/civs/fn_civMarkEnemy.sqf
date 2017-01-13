params ["_side","_accuracy"];

if (typeName _accuracy == "ARRAY") then {_accuracy = (random ((_accuracy select 1)-(_accuracy select 0))) + (_accuracy select 0)};

_enemyUnits = playableUnits select {alive _x && (side _x == _side) && (_x distance CITYPOSITION) < CITYAREASIZE};

if (count _enemyUnits > 0) then {
    _enemyUnit = selectRandom _enemyUnits;
    [_side,_enemyUnit,_accuracy] remoteExec ['uo_fnc_createCivEnemyMarker',0,false];
};
