//respawn not possible
if (player getVariable "wr_interrupted") exitWith {
  private ["_explanation"];
  setPlayerRespawnTime 99999;
  if (player getVariable ["originalSide", "UNKNOWN"] == "WEST") then {
    _explanation = parseText format ["<t align='center' size='1.4'>Kommandofahrzeug zerstört!</t>"];
  } else {
    _explanation = parseText format ["<t align='center' size='1.4'>Dealer wurde getötet!</t>"];
  };
  _respawnIn = parseText format ["<t align='center' size='1.4'>Respawn <t color='#cc0000'>nicht mehr verfügbar.</t></t>"];
  [_explanation, _respawnIn] call mcd_fnc_respawnHint;

  ["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;
};


//respawn possible
_respawning = parseText format ["<t align='center' color='#00ff00' size='1.4'>Respawning...</t>"];
[_respawning] call mcd_fnc_respawnHint;
setPlayerRespawnTime 0;
forceRespawn player;
[] spawn {
  sleep 5;
  hint "";
  setPlayerRespawnTime 9999;
};
