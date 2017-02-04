params [["_object",objNull]];

//terminate old marker
_oldHandle = missionNamespace getVariable ["uo_selectedRespawnMarkerPFH",-1];
if (_oldHandle > 0) then {
    [_oldHandle] call CBA_fnc_removePerFrameHandler;
    uo_selectedRespawnMarkerPFH = -1;
};
deleteMarkerLocal "uo_respawnSelectorMarker";

if (isNull _object || !(_object getVariable ["uo_respawnObject_isActive", false])) exitWith {
    uo_selectedRespawnObject = objNull;
};

uo_selectedRespawnObject = _object;

//create new marker
_marker = createMarkerLocal ["uo_respawnSelectorMarker", [0,0,0]];
_marker setMarkerTypeLocal "Select";
uo_respawnSelectorMarker = _marker;

uo_selectedRespawnMarkerPFH = [{
    params ["_args", "_handle"];
    _args params ["_marker","_object"];

    if !(_object getVariable ["uo_respawnObject_isActive", false]) exitWith {
        [objNull] call uo_waverespawn_fnc_respawnSelectorMarker;
    };

    _marker setMarkerPosLocal (getPos _object);
} , 0.1, [_marker,_object]] call CBA_fnc_addPerFrameHandler;
