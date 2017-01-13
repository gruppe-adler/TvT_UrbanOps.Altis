params ["_group",["_mode","COPY"],["_saveCombatmode",true],["_saveSpeed",true],["_waypointSettings",[]]];

_oldWaypointSettings = [];

if (_mode == "COPY") then {
    {
        _theseSettings = [
            waypointPosition _x,
            waypointType _x,
            waypointTimeout _x
        ];
        if (_saveCombatmode) then {_theseSettings pushBack (waypointCombatMode _x)};
        if (_saveSpeed) then {_theseSettings pushBack (waypointSpeed _x)};

        _oldWaypointSettings pushBack _theseSettings;
    } forEach waypoints _group;
};

if (_mode == "PASTE") then {
    {
        _x params ["_pos","_type","_timeout",["_combatMode","NO CHANGE"],["_speed","UNCHANGED"]];
        _wp = _group addWaypoint [_pos, 0];
        _wp setWaypointType _type;
        _wp setWaypointTimeout _timeout;
        if (_saveCombatmode) then {_wp setWaypointCombatMode _combatMode};
        if (_saveSpeed) then {_wp setWaypointSpeed _speed};
    } forEach _waypointSettings;
};


_oldWaypointSettings
