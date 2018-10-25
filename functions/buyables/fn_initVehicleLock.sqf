#include "script_component.hpp"

if (!isServer) exitWith {};


params [["_buyer",objNull],"",["_veh",objNull]];

private _vehSide = if (_buyer isEqualType objNull) then {side _buyer} else {_buyer};

_veh setVariable ["ace_vehiclelock_lockSide",_vehSide,true];

private _keyClass = switch (_vehSide) do {
    case (west):       {"ACE_key_west"};
    case (east):       {"ACE_key_east"};
    case (resistance): {"ACE_key_indp"};
    default            {"ACE_key_civ"};
};

_veh addItemCargoGlobal [_keyClass,1];
