/*  Creates local marker, remote executed by mcd_fnc_createSideMarker
*
*   Params:
*   0:  side
*   1:  name
*   2:  position
*   3:  type (optional, default: dot)
*   4:  color (optional, default: black)
*   5:  text (optional, default: "")
*   6:  shape (optional, default: icon)
*   7:  size (optional, default: 1)
*   8:  alpha (optional, default: 1)
*   9:  brush (optional,  default: solid)
*/

if (!hasInterface) exitWith {};

params [
  "_side",
  "_name",
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
if (getMarkerType _name != "") exitWith {diag_log format ["fn_createSideMarkerRemote - Markername %1 is already in use.", _name]};

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
_marker setMarkerSizeLocal [_size, _size];
_marker setMarkerTypeLocal _type;
_marker setMarkerTextLocal _text;
