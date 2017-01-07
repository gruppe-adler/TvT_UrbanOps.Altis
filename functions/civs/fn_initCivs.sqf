if (!isServer) exitWith {};

_houses = [] call uo_fnc_findHouses;
[_houses] call uo_fnc_spawnDealer;
[_houses] call uo_fnc_createCivs;
