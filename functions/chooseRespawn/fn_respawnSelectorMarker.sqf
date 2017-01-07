params [["_object",objNull]];


//terminate old marker
_oldHandle = missionNamespace getVariable ["uo_selectedRespawnMarkerPFH",-1];
if (_oldHandle > 0) then {
    [_oldHandle] call CBA_fnc_removePerFrameHandler;
};
deleteMarkerLocal (missionNamespace getVariable ["uo_respawnSelectorMarker",""]);

if (isNull _object) exitWith {};


//create new marker
_marker = createMarkerLocal ["uo_respawnSelectorMarker", getPos _object];
_marker setMarkerTypeLocal "Select";
uo_respawnSelectorMarker = _marker;

uo_selectedRespawnMarkerPFH = [{
    params ["_args", "_handle"];
    _args params ["_marker","_object"];

    if !(_object getVariable ["uo_respawnObject_isActive", false]) exitWith {
        deleteMarkerLocal _marker;
        [_handle] call CBA_fnc_removePerFrameHandler;

        uo_respawnSelectorMarker = "";
        uo_selectedRespawnMarkerPFH = -1;
    };

    _marker setMarkerPosLocal (getPos _object);
} , 0.1, [_marker,_object]] call CBA_fnc_addPerFrameHandler;
