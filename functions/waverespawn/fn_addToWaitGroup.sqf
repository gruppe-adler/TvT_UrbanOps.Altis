params ["_side","_unit"];

if (_side == WEST) then {
    if (isNull DEADPLAYERSBLU_GROUP) then {
        DEADPLAYERSBLU_GROUP = createGroup civilian;
        publicVariable "DEADPLAYERSBLU_GROUP";
        DEADPLAYERSBLU_GROUP setVariable ["ace_map_hideBlueForceMarker",true,true];
    };

    [_unit] joinSilent DEADPLAYERSBLU_GROUP;
};

if (_side == EAST) then {
    if (isNull DEADPLAYERSOPF_GROUP) then {
        DEADPLAYERSOPF_GROUP = createGroup civilian;
        publicVariable "DEADPLAYERSOPF_GROUP";
        DEADPLAYERSOPF_GROUP setVariable ["ace_map_hideBlueForceMarker",true,true];
    };

    [_unit] joinSilent DEADPLAYERSOPF_GROUP;
};
