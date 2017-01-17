params [["_civ",objNull]];
private ["_weapon","_magazine"];

if (!alive _civ || isNull _civ) exitWith {};
if (!local _civ) exitWith {};

//ADD MILITIA GEAR =============================================================
_availableHandguns = [(missionConfigFile >> "cfgCivilians" >>  "handguns"), "array", []] call CBA_fnc_getConfigEntry;
_availableRifles = [(missionConfigFile >> "cfgCivilians" >>  "rifles"), "array", []] call CBA_fnc_getConfigEntry;
_availableFacewear = [(missionConfigFile >> "cfgCivilians" >>  "militiaFacewear"), "array", []] call CBA_fnc_getConfigEntry;
_availableVests = [(missionConfigFile >> "cfgCivilians" >>  "militiaVests"), "array", []] call CBA_fnc_getConfigEntry;

if (30 > random 100) then {
    _faceWear = selectRandom _availableFacewear;
    removeGoggles _civ;
    _civ addGoggles _faceWear;
};

if (30 > random 100) then {
    _vest = selectRandom _availableVests;
    removeVest _civ;
    _civ addVest _vest;
};

if (20 > random 100) then {
    _weaponAndMag = selectRandom _availableRifles;
    _weapon = _weaponAndMag select 0;
    _magazine = _weaponAndMag select 1;
} else {
    _weaponAndMag = selectRandom _availableHandguns;
    _weapon = _weaponAndMag select 0;
    _magazine = _weaponAndMag select 1;
};

while {_civ canAdd _magazine} do {
    _civ addMagazine _magazine;
};
_civ addWeapon _weapon;


//REMOVE KILLED EH =============================================================
_ehID = _civ getVariable ["uo_killedEH",-1];
if (_ehID > 0) then {
    _civ removeEventHandler ["killed",_ehID];
};


//SET TO INDEPENDENT ===========================================================
_oldWaypointSettings = [group _civ,"COPY",false,false] call uo_common_fnc_copyWaypoints;

_group = createGroup INDEPENDENT;
[_civ] joinSilent _group;
_group setBehaviour "COMBAT";
_group setCombatMode "RED";

[_group,"PASTE",false,false,_oldWaypointSettings] call uo_common_fnc_copyWaypoints;
