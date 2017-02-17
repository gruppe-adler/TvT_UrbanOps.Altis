params ["_unit"];

_explosive = "DemoCharge_Remote_Ammo_Scripted" createVehicle (getPos _unit);
[{!isNull _this}, {_this setDamage 1}, _explosive] call CBA_fnc_waitUntilAndExecute;
