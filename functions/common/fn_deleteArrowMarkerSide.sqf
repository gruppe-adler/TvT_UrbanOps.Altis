params ["_side","_name"];

if (typeName _side != "ARRAY") then {_side = [_side]};
if !(side player in _side) exitWith {};

_mainName = _name  + "_main";
_fin1Name = _name + "_fin1";
_fin2Name = _name + "_fin2";

deleteMarkerLocal _mainName;
deleteMarkerLocal _fin1Name;
deleteMarkerLocal _fin2Name;
