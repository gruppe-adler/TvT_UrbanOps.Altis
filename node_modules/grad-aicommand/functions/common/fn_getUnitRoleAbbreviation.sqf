/*
 *  Adaptation of STHUD by Shacktac
 */

#include "script_component.hpp"

params [["_unit",objNull]];

// check vehicle roles
if (vehicle _unit != _unit) exitWith {
    private _crewInfo = ((fullCrew (vehicle _unit)) select {_x select 0 isEqualTo _unit}) select 0;
    _crewInfo params ["", "_role", "_index", "_turretPath", "_isTurret"];
	if (_role == "cargo" || (_role == "turret" && _isTurret)) exitWith {"CARGO"};
    if (_role == "driver") exitWith {
        if (vehicle _unit isKindOf "Air") then {"PILOT"} else {"DRIVER"};
    };

    if (_role == "gunner" || (_role == "turret" && !_isTurret)) exitWith {"GUNNER"};
    if (_role == "commander") exitWith {"CMD"};
};

// check FTL
if (leader(_unit) == _unit) exitWith {"FTL"};

// check Medic
if ([_unit] call ace_medical_fnc_isMedic) exitWith {"MEDIC"};

// create weapon type namespace if it doesn't exist yet
if (isNil QGVAR(weaponTypeNamespace)) then {GVAR(weaponTypeNamespace) = [] call CBA_fnc_createNamespace};

// check MG
private _primaryWeapon = primaryWeapon _unit;
private _isMG = GVAR(weaponTypeNamespace) getVariable _primaryWeapon;
if (isNil "_isMG") then {
    _isMG = getText (configFile >> "CfgWeapons" >> _primaryWeapon >> "UIPicture") == "\a3\weapons_f\data\ui\icon_mg_ca.paa";
    if (_primaryWeapon != "") then {
        GVAR(weaponTypeNamespace) setVariable [_primaryWeapon,_isMG];
    };
};
if (_isMG) exitWith {"MG"};

// check AT
private _secondaryWeapon = secondaryWeapon _unit;
private _isAT = GVAR(weaponTypeNamespace) getVariable _secondaryWeapon;
if (isNil "_isAT") then {
    _isAT = getText (configFile >> "CfgWeapons" >> _secondaryWeapon >> "UIPicture") == "\a3\weapons_f\data\ui\icon_at_ca.paa";
    if (_secondaryWeapon != "") then {
        GVAR(weaponTypeNamespace) setVariable [_secondaryWeapon,_isAT];
    };
};
if (_isAT) exitWith {"AT"};

// default return
"RFL"
