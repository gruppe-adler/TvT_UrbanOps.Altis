if (!isServer) exitWith {};

_houses = [] call mcd_fnc_findHouses;
[_houses] call mcd_fnc_spawnDealer;
[_houses] call mcd_fnc_createCivs;
