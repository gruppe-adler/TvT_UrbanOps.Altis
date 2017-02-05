params ["_side","_selected",["_pos",[0,0,0]]];
private ["_selected"];


//terminate old marker
_oldHandle = missionNamespace getVariable ["uo_selectedRespawnMarkerPFH",-1];
if (_oldHandle > 0) then {
    [_oldHandle] call CBA_fnc_removePerFrameHandler;
    uo_selectedRespawnMarkerPFH = -1;
};
deleteMarkerLocal "uo_respawnSelectorMarker";


if (_side == WEST) then {
    if (isNil "_selected") then {_selected = objNull};

    if (isNull _selected || !(_selected getVariable ["uo_respawnObject_isActive", false])) exitWith {
        uo_selectedRespawnObject = objNull;
    };

    uo_selectedRespawnObject = _selected;

    //create new marker
    _marker = createMarkerLocal ["uo_respawnSelectorMarker", [0,0,0]];
    _marker setMarkerTypeLocal "Select";
    uo_respawnSelectorMarker = _marker;

    uo_selectedRespawnMarkerPFH = [{
        params ["_args", "_handle"];
        _args params ["_marker","_selected"];

        if !(_selected getVariable ["uo_respawnObject_isActive", false]) exitWith {
            [WEST,objNull] call uo_waverespawn_fnc_respawnSelectorMarker;
        };

        _marker setMarkerPosLocal (getPos _selected);
    } , 0.1, [_marker,_selected]] call CBA_fnc_addPerFrameHandler;
};

if (_side == EAST) then {
    if (isNil "_selected") then {_selected = -1};

    if (_selected < 0 || !([_selected] call uo_sectors_fnc_checkSector)) exitWith {
        uo_selectedRespawnPos = [0,0,0];
    };

    uo_selectedRespawnPos = _pos;

    //create new marker
    _marker = createMarkerLocal ["uo_respawnSelectorMarker", _pos];
    _marker setMarkerTypeLocal "mil_start";
    _marker setMarkerColorLocal "COLOREAST";
    uo_respawnSelectorMarker = _marker;

    uo_selectedRespawnMarkerPFH = [{
        params ["_args", "_handle"];
        _args params ["_marker","_selected"];

        if !([_sectorID] call uo_sectors_fnc_checkSector) exitWith {
            [EAST,-1] call uo_waverespawn_fnc_respawnSelectorMarker;
        };

    } , 0.1, [_marker,_sectorID]] call CBA_fnc_addPerFrameHandler;
};
