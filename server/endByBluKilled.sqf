/*  Ends the game after Blufor is killed and Commandvehicle is destroyed
*
*   executed via init.sqf on server
*/

waitUntil {!isNil "GAMESTARTED"};
waitUntil {GAMESTARTED};

checkBluForReal = {
  _condition = true;
	for [{_i=0}, {_i<10}, {_i=_i+1}] do
	{
    _condition = (({side _x == west} count playableUnits)  + ({side _x == west} count switchableUnits) == 0 && COMMANDVEHICLEDESTROYED);
		if (!_condition) exitWith {};
		sleep 1;
	};
	if (_condition) then {BLUFORELIMINATED = true;};
};

[] spawn {
    while {true} do {
        BLUFOR_PRE_ELIMINATED = (({side _x == west} count playableUnits)  + ({side _x == west} count switchableUnits) == 0 && COMMANDVEHICLEDESTROYED);
        if (BLUFOR_PRE_ELIMINATED) then {[] spawn checkBluForReal;};

        if (BLUFORELIMINATED) exitWith {
          GAMEENDED = true;
          publicVariable "GAMEENDED";
          publicVariable "BLUFORELIMINATED";
        };
        sleep 11;
    };
};
