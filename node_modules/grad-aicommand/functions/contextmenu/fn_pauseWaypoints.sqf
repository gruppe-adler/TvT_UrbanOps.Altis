#include "script_component.hpp"

params [["_group",grpNull],["_pause",false]];

_group setVariable [QGVAR(isPaused),_pause,true];

private _fnc_enable = {
    [_x,"PATH"] remoteExecCall ["enableAI",_x,false];
};

private _fnc_disable = {
    [_x,"PATH"] remoteExecCall ["disableAI",_x,false];
};

([_fnc_enable,_fnc_disable] select _pause) forEach (units _group);
