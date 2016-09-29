if (!isServer) exitWith {};

mcd_fnc_endByBluKilled_preEliminated = {
  [{
    if (({side _x == west} count playableUnits)  + ({side _x == west} count switchableUnits) == 0 && COMMANDVEHICLEDESTROYED) then {
      [] call mcd_fnc_endByBluKilled_eliminated;
      [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
  } , 10, []] call CBA_fnc_addPerFrameHandler;
};


mcd_fnc_endByBluKilled_eliminated = {
  [{
    if (({side _x == west} count playableUnits)  + ({side _x == west} count switchableUnits) == 0 && COMMANDVEHICLEDESTROYED) then {
      _downSince = missionNamespace getVariable ["uo_bluDownSince", 0];
      missionNamespace setVariable ["uo_bluDownSince", _downSince + 1];
    } else {
      missionNamespace setVariable ["uo_bluDownSince", 0];
      [] call mcd_fnc_endByBluKilled_preEliminated;
      [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    if (missionNamespace getVariable ["uo_bluDownSince", 0] > 15) then {
      missionNamespace setVariable ["uo_gameEnded", true, true];
      missionNamespace setVariable ["uo_bluEliminated", true, true];
      [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
  } , 1, []] call CBA_fnc_addPerFrameHandler;
};

[] call mcd_fnc_endByBluKilled_preEliminated;
