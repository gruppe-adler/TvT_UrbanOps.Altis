params ["_unit","_caller","_args"];

systemChat str _this;

if ((group _unit) getVariable ["grad_aicommand_isWaiting",false]) exitWith {};
(group _unit) setVariable ["grad_aicommand_isWaiting",true,true];
{_x disableAI "PATH"} forEach (units group _unit);

[{
    [{
        
        params ["_args","_handle"];
        _args params ["_unit","_caller"];

        if !((group _unit) getVariable ["grad_aicommand_isBeingEdited",false]) then {
            (group _unit) setVariable ["grad_aicommand_isWaiting",false,true];
            {_x enableAI "PATH"} forEach (units group _unit);
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

    } , 3, _this] call CBA_fnc_addPerFrameHandler;
}, _this, 3] call CBA_fnc_waitAndExecute;
