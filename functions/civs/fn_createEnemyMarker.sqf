params ["_side","_enemyUnit","_accuracy","_markerType"];

if !(hasInterface) exitWith {};
if (side player != _side) exitWith {};

["data\report.paa","Report incoming...","uo_morse"] call uo_ui_fnc_animatedHint;

_pos = _enemyUnit getRelPos [random _accuracy, random 360];
_name = format ["uo_enemyMarker_%1_%2_%3",str _side,str round time,str round random 100];   //super unique marker name, yo

_marker = createMarkerLocal [_name, _pos];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal _markerType;

[{
    params ["_marker", "_handle"];
    _alpha = (markerAlpha _marker) - 0.1;

    if (_alpha < 0.5) exitWith {
        deleteMarkerLocal _marker;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _marker setMarkerAlphaLocal _alpha;
} , 30, _marker] call CBA_fnc_addPerFrameHandler;
