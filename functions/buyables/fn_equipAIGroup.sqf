params ["_group","_loadoutClasses"];

if (!isServer) exitWith {};

_faction = if (side _group == EAST) then {uo_missionParam_OPFORFACTION} else {uo_missionParam_BLUFORFACTION};
if (typeName _loadoutClasses != "ARRAY") then {_loadoutClasses = [_loadoutClasses]};

{
    [_x,_faction,selectRandom _loadoutClasses] call uo_buyables_fnc_equipAI;
} forEach units _group;
