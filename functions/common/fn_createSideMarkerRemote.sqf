/*    Creates local marker, remote executed by uo_fnc_createSideMarker
*
*     Params:
*     0:    side
*     1:    name
*     2:    delete old marker if name already in use
*     3:    position
*     4:    type (optional, default: dot)
*     5:    color (optional, default: black)
*     6:    text (optional, default: "")
*     7:    shape (optional, default: icon)
*     8:    size (optional, default: 1)
*     9:    alpha (optional, default: 1)
*    10:    brush (optional,    default: solid)
*/

if (!hasInterface) exitWith {};

params [
    "_side",
    "_name",
    "_overwrite",
    "_pos",
    ["_type", "hd_dot"],
    ["_color", "Default"],
    ["_text", ""],
    ["_shape", "ICON"],
    ["_size", 1],
    ["_alpha", 1.0],
    ["_brush", "Solid"]
];

if (side player != _side) exitWith {};
if (getMarkerType _name != "") then {
    if (_overwrite) then {
        deleteMarkerLocal _name;
    } else {
        diag_log format ["fn_createSideMarkerRemote - Markername %1 is already in use.", _name];
    };
};

/*_i = 1;
_originalName = _name;
while {getMarkerType _name != ""} do {
    _name = _originalName + format ["_%1",_i];
    _i = _i + 1;
};*/

_marker = createMarkerLocal [_name, _pos];
_marker setMarkerAlphaLocal _alpha;
_marker setMarkerBrushLocal _brush;
_marker setMarkerColorLocal _color;
_marker setMarkerShapeLocal _shape;
_marker setMarkerTypeLocal _type;
_marker setMarkerTextLocal _text;

if (typeName _size == "ARRAY") then {
    _marker setMarkerSizeLocal _size;
} else {
    _marker setMarkerSizeLocal [_size, _size];
};
