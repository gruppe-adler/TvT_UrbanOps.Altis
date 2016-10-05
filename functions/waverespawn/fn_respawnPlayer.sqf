//respawn not possible
if (player getVariable ["wr_interrupted", false]) exitWith {
  private ["_explanation"];

  setPlayerRespawnTime 99999;

  _explanation = if (player getVariable ["originalSide", "UNKNOWN"] == "WEST") then {"Kommandofahrzeug zerstört!</t>"} else {"Dealer wurde getötet!"};
  _explanation = parseText format ["<t align='center' size='1.4'>%1</t>", _explanation];
  _respawnIn = parseText format ["<t align='center' size='1.4'>Respawn <t color='#cc0000'>nicht mehr verfügbar.</t></t>"];
  [_explanation, _respawnIn] call mcd_fnc_respawnHint;

  ["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;
};


//respawn possible
_respawning = parseText format ["<t align='center' color='#00ff00' size='1.4'>Respawning...</t>"];
[_respawning] call mcd_fnc_respawnHint;

_waitCondition = if (player getVariable "originalSide" == "WEST") then {{WAVERESPAWNBLU}} else {{WAVERESPAWNOPF}};
[{call (_this select 0)}, {
  setPlayerRespawnTime 0;
  forceRespawn player;
  [] spawn {
    sleep 5;
    hint "";
    setPlayerRespawnTime 99999;
  };
}, [_waitCondition]] call CBA_fnc_waitUntilAndExecute;
