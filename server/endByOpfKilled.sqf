/*  Ends the game after Opfor and Dealer are killed and city is under OPFOR control
*
*   executed via init.sqf on server
*/

waitUntil {!isNil "GAMESTARTED"};
waitUntil {GAMESTARTED};

checkOpfForReal = {
  _condition = true;
	for [{_i=0}, {_i<10}, {_i=_i+1}] do
	{
    _condition = (({side _x == east} count playableUnits)  + ({side _x == east} count switchableUnits) == 0 && DEALERKILLED && BLUFORINCONTROL);
		if (!_condition) exitWith {};
		sleep 1;
	};
	if (_condition) then {diag_log "endByOpfKilled.sqf - Opfor and Dealer dead. City under Blufor control. Second check complete. Ending game."; OPFORELIMINATED = true;};
};

[] spawn {
    while {true} do {
        OPFOR_PRE_ELIMINATED = (({side _x == east} count playableUnits)  + ({side _x == east} count switchableUnits) == 0 && DEALERKILLED && BLUFORINCONTROL);
        if (OPFOR_PRE_ELIMINATED) then {diag_log "endByOpfKilled.sqf - Opfor and Dealer dead. City under Blufor control. Spawning second check."; [] spawn checkOpfForReal;};

        if (OPFORELIMINATED) exitWith {
          GAMEENDED = true;
          publicVariable "GAMEENDED";
          publicVariable "OPFORELIMINATED";
        };
        sleep 11;
    };
};
