waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {!isNull (findDisplay 46)};

_isCommander = false;

_layer = (["wait1Layer"] call BIS_fnc_rscLayer);
while {isNil "CITYPOSITION"} do {
  _layer cutRsc ["bluforWaitMessage1", "PLAIN", 0.0001, true];
  sleep 1;
};

waitUntil {!isNil "CITYPOSITION"};
mcd_fnc_waitDialogText = {((_this select 0) displayCtrl 1402) ctrlSetText format ["TIME REMAINING: %1", ([SETUPTIMEREMAINING,"MM:SS"] call BIS_fnc_secondsToString)]};
while {SETUPTIMEREMAINING > 0} do {
  _layer cutRsc ["bluforWaitMessage2", "PLAIN", 0.0001, true];
  sleep 1;
};

if (!isNil "bluforcommander") then {_isCommander = (player == bluforcommander)};
if (_isCommander) then {
  while {isNil "SPAWNCHOSEN"} do {
    _layer cutRsc ["chooseSpawnGUI", "PLAIN", 0.0001, true];
  };
} else {
  while {isNil "SPAWNCHOSEN"} do {
    _layer cutRsc ["bluforWaitMessage3", "PLAIN", 0.0001, true];
    sleep 1;
  };
};

player say "taskSucceeded";
_layer cutFadeOut 1;
