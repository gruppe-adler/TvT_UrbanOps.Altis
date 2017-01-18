params ["_civ","_caller"];

if (!isServer) exitWith {};

_civKills = if (side _caller == WEST) then {CIVSKILLEDBLU - CIVSKILLEDOPF} else {CIVSKILLEDOPF - CIVSKILLEDBLU};
if (_civKills > random 10) exitWith {[_civ] call uo_civs_fnc_doFlee};

_surrenderTime = (60 + random 120) - (_civKills * random 30);

[_civ,true] call ace_captives_fnc_setSurrendered;
[{
    params ["_civ","_civKills"];
    [_civ,false] call ace_captives_fnc_setSurrendered;
    if (_civKills > random 10) then {[_civ] call uo_civs_fnc_doFlee};
}, [_civ,_civKills], _surrenderTime max 10] call CBA_fnc_waitAndExecute;
