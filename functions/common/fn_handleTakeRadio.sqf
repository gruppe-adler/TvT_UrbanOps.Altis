#define PREFIX uo
#define COMPONENT common
#include "\x\cba\addons\main\script_macros_mission.hpp"


params ["_unit","_container","_item"];

_isHandheld = _item isKindOf ["ItemRadio", configFile >> "CfgWeapons"];
_isLongrange = _item isKindOf "TFAR_Bag_Base";


if (!_isHandheld && !_isLongrange) exitWith {};


if (isNil {_unit getVariable "uo_unitAllowedRadios"}) then {_unit setVariable ["uo_unitAllowedRadios",[_unit] call uo_common_fnc_getAllowedRadios]};
_allowedRadios = _unit getVariable ["uo_unitAllowedRadios",[]];


if (_item in _allowedRadios) exitWith {};


if (_isLongrange) then {
    systemChat "You cannot take this radio.";
    if (backpack _unit == _item) then {removeBackpackGlobal _unit} else {_unit removeItem _item};

} else {
    systemChat "You cannot take this radio.";
    player removeItem _item;
    player unlinkItem _item;
    (if (isNull _container) then {createVehicle ["groundWeaponHolder", getPos player, [], 0, "can_Collide"]} else {_container}) addItemCargoGlobal [_item,1];
};
