params ["_unit","_player"];

_nearestMen = nearestObjects [_unit, ["Man"], 50];
_nearestAlliedAI = _nearestMen select {!isPlayer _x && side _x == side _unit && group _x != group _unit};

if (count _nearestAlliedAI > 0) then {
    (units group _unit) joinSilent (_nearestAlliedAI select 0)
};
