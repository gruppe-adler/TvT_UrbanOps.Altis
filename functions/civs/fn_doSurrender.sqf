params ["_civ","_caller"];

[_civ,true] call ace_captives_fnc_setSurrendered;

[{
    params ["_civ"];
    [_civ,false] call ace_captives_fnc_setSurrendered;
}, [_civ], (random 180) max 15] call CBA_fnc_waitAndExecute;
