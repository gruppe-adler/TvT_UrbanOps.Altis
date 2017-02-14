params ["_box","_caller"];
private ["_special"];

_boatsLeft = _box getVariable ["uo_buyables_boatsInBox",0];
if (_boatsLeft < 1) exitWith {};

_boatType = _box getVariable ["uo_buyables_boatType",""];
if (_boatType == "") exitWith {};

_box setVariable ["uo_buyables_boatsInBox",_boatsLeft-1,true];

_pos = (getPos _box) findEmptyPosition [0,10, _boatType];
createVehicle [_boatType, _pos, [], 0, "NONE"];
