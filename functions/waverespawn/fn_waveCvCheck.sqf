//check interrupt
if (player getVariable "wr_interrupted") exitWith {
  player setVariable ["wr_cvCheckDone", true];
};

if (player getVariable ["originalSide", "UNKNOWN"] == "WEST") then {
  if (!CVACTIVE) then {
    [{
      _status = parseText "<t align='center' size='1.4'>Commandvehicle ist in Bewegung oder nicht im Spawnbereich.</t>";
      _wait = parseText "<t align='center' size='1.4' color='#ff0000'>Warte...</t>";
      [_status, _wait] call mcd_fnc_respawnHint;
      CVACTIVE
    }, {player setVariable ["wr_cvCheckDone", true];}, []] call CBA_fnc_waitUntilAndExecute;
  };

} else {
  player setVariable ["wr_cvCheckDone", true];
};
