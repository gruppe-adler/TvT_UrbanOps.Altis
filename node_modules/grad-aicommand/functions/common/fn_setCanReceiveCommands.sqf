#include "script_component.hpp"

params ["_unitOrGroup","_canReceive"];

_unitOrGroup setVariable [QGVAR(canReceiveCommands),_canReceive,true];
