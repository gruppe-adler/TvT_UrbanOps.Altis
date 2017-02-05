params ["_group"];

_highestRank = -1;
_highestRanking = objNull;

{
    if (rankID _x > _highestRank) then {
        _highestRank = rankID _x;
        _highestRanking = _x;
    };
} forEach (units _group);

_highestRanking
