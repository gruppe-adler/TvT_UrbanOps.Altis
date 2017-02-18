
_configPath = missionConfigFile >> "CfgIslands" >>  worldName >> "customLocations";
_customLocations = "true" configClasses _configPath;

{
    _pos = [(_x >> "pos"), "array", [0,0]] call CBA_fnc_getConfigEntry;
    _text = [(_x >> "name"), "text", ""] call CBA_fnc_getConfigEntry;
    _type = [(_x >> "type"), "text", "NameVillage"] call CBA_fnc_getConfigEntry;

    _location = createLocation [_type,_pos,100,100];
    _location setText _text;
} forEach _customLocations;
