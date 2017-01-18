/*  Creates an arrow marker
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

params ["_name","_pos","_dir",["_color","COLORBLACK"],["_size",50]];

_mainLength = _size/2;
_finLength = 0.1 * _size;
_brushSize = 0.02 * _size;

_tipPos = [_pos, _mainLength * 1.1, _dir] call BIS_fnc_relPos;
_fin1Pos = [_tipPos, -(_finLength * 1.138), _dir-30] call BIS_fnc_relPos;
_fin2Pos = [_tipPos, -(_finLength * 1.138), _dir+30] call BIS_fnc_relPos;

_mainName = _name  + "_main";
_fin1Name = _name + "_fin1";
_fin2Name = _name + "_fin2";

_marker = createMarker [_mainName, _pos];
_marker setMarkerBrush "SolidFull";
_marker setMarkerColor _color;
_marker setMarkerShape "RECTANGLE";
_marker setMarkerSize [_mainLength,_brushSize];
_marker setMarkerDir (_dir-90);

_marker = createMarker [_fin1Name, _fin1Pos];
_marker setMarkerBrush "SolidFull";
_marker setMarkerColor _color;
_marker setMarkerShape "RECTANGLE";
_marker setMarkerSize [_finLength,_brushSize];
_marker setMarkerDir (_dir+45);
_marker setMarkerPos _fin1Pos;

_marker = createMarker [_fin2Name, _fin2Pos];
_marker setMarkerBrush "SolidFull";
_marker setMarkerColor _color;
_marker setMarkerShape "RECTANGLE";
_marker setMarkerSize [_finLength,_brushSize];
_marker setMarkerDir (_dir-45);
_marker setMarkerPos _fin2Pos;

[_mainName,_fin1Name,_fin2Name]
