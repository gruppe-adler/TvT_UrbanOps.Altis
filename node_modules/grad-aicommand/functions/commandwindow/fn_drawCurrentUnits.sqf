params ["_map"];

_currentUnit = missionNamespace getVariable ["grad_aicommand_currentUnit",objNull];

if (isNull _currentUnit) exitWith {};

_color = [_currentUnit] call grad_aicommand_fnc_getUnitColor;

{
    _map drawIcon ["iconMan",_color,getPos _x,24,24,getDir _x,"",0,0.03,'TahomaB','right'];
    false
} count (units group _currentUnit);
