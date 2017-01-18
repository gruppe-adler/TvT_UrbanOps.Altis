/*  Creates an arrow marker locally for one side
*
*   Parameters:
*   0: Name of marker <String>
*   1: Position of marker <Array>
*   2: Direction of marker <Number>
*   3: Color of marker <String> (optional)
*   4: Size of marker - default is 50 <Number> (optional)
*
*   Returns:
*   Marker <String>
*/

params ["_side","_name","_pos","_dir",["_color","COLORBLACK"],["_size",50]];

if (typeName _side != "ARRAY") then {_side = [_side]};
if !(side player in _side) exitWith {};

_mainLength = _size/2;
_finLength = 0.1 * _size;
_brushSize = 0.02 * _size;

_tipPos = [_pos, _mainLength * 1.1, _dir] call BIS_fnc_relPos;
_fin1Pos = [_tipPos, -(_finLength * 1.138), _dir-30] call BIS_fnc_relPos;
_fin2Pos = [_tipPos, -(_finLength * 1.138), _dir+30] call BIS_fnc_relPos;

_mainName = _name  + "_main";
_fin1Name = _name + "_fin1";
_fin2Name = _name + "_fin2";

_marker = createMarkerLocal [_mainName, _pos];
_marker setMarkerBrushLocal "SolidFull";
_marker setMarkerColorLocal _color;
_marker setMarkerShapeLocal "RECTANGLE";
_marker setMarkerSizeLocal [_mainLength,_brushSize];
_marker setMarkerDirLocal (_dir-90);

_marker = createMarkerLocal [_fin1Name, _fin1Pos];
_marker setMarkerBrushLocal "SolidFull";
_marker setMarkerColorLocal _color;
_marker setMarkerShapeLocal "RECTANGLE";
_marker setMarkerSizeLocal [_finLength,_brushSize];
_marker setMarkerDirLocal (_dir+45);
_marker setMarkerPosLocal _fin1Pos;

_marker = createMarkerLocal [_fin2Name, _fin2Pos];
_marker setMarkerBrushLocal "SolidFull";
_marker setMarkerColorLocal _color;
_marker setMarkerShapeLocal "RECTANGLE";
_marker setMarkerSizeLocal [_finLength,_brushSize];
_marker setMarkerDirLocal (_dir-45);
_marker setMarkerPosLocal _fin2Pos;

[_mainName,_fin1Name,_fin2Name]
