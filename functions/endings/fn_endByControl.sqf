if (!isServer) exitWith {};

[{
  if (BLUFORINCONTROL) then {
    CAPTURETIMEREMAINING = CAPTURETIMEREMAINING - 1;
    publicVariable "CAPTURETIMEREMAINING";

    if (CAPTURETIMEREMAINING <= 0) then {
      CITYCAPTURED = true;
      publicVariable "CITYCAPTURED";
      missionNamespace setVariable ["uo_gameEnded", true, true];
      [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
  };
} , 1, []] call CBA_fnc_addPerFrameHandler;
