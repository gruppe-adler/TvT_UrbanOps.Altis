params ["_unit","_canReceive",["_wholeGroup",true]];

if (typeName _unit == "GROUP") then {_unit = leader _unit; _wholeGroup = true};
_units = if (_wholeGroup) then {units group _unit} else {[_unit]};

{
    _x setVariable ["grad_aicommand_canReceiveCommands",_canReceive,true];
} forEach _units;
