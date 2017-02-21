params ["_unit"];

_terrainClass = if (uo_missionParam_ISWOODLAND) then {"loadoutWood"} else {"loadoutDes"};
_unitFaction = switch (side _unit) do {
    case (WEST): {getText (missionConfigFile >> "cfgFactions" >> uo_missionParam_BLUFORFACTION >> _terrainClass)};
    case (EAST): {getText (missionConfigFile >> "cfgFactions" >> uo_missionParam_OPFORFACTION >> _terrainClass);};
};
_unitLoadoutClass = missionConfigFile >> "Loadouts" >> "Faction" >> _unitFaction;


_allowedRadios = [];
_allowedRadios pushBack ([_unitLoadoutClass >> "AllUnits" >> "radio","text",""] call CBA_fnc_getConfigEntry);
_allowedRadios pushBack ([_unitLoadoutClass >> "AllUnits" >> "backpack","text",""] call CBA_fnc_getConfigEntry);

_loadouts = "true" configClasses (missionConfigFile >> "Loadouts" >> "Faction" >> _unitFaction >> "Type");
{
    _radio = [_x >> "radio","text",""] call CBA_fnc_getConfigEntry;
    _backpack = [_x >> "backpack","text",""] call CBA_fnc_getConfigEntry;
    if (_radio != "") then {_allowedRadios pushBack _radio};
    if (_backpack != "") then {_allowedRadios pushBack _backpack};
} forEach _loadouts;


_allowedRadios
