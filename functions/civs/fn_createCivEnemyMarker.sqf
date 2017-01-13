params ["_side","_enemyUnit","_accuracy"];

if !(hasInterface) exitWith {};
if (side player == _side) exitWith {};

_pos = _enemyUnit getRelPos [random _accuracy, random 360];
_dir = getDir _enemyUnit;
_type = if (_side == east) then {"o_inf"} else {"b_inf"};
_name = format ["uo_enemyMarker_%1_%2_%3",str _side,str round time,str round random 100];   //super unique marker name, yo

_marker = createMarkerLocal [_name, _pos];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal _type;
_marker setMarkerDirLocal _dir;

[{
    params ["_marker", "_handle"];
    _alpha = markerAlpha _marker;

    if (_alpha <= 0) exitWith {
        deleteMarkerLocal _marker;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _marker setMarkerAlphaLocal (_alpha - 0.1);
} , 15, _marker] call CBA_fnc_addPerFrameHandler;
