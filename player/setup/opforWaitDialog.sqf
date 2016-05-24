waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {!isNull (findDisplay 46)};

_isCommander = false;

if (!isNil "opforcommander") then {_isCommander = (player == opforcommander)};
if (_isCommander) then {
  while {isNil "CITYCHOSEN"} do {
    99 cutRsc ["chooseCityGUI", "PLAIN", 0.0001, true];
  };
} else {
  while {isNil "CITYCHOSEN"} do {
    99 cutRsc ["opforwaitmessage", "PLAIN", 0.0001, true];
    sleep 1;
  };
};

player say "taskSucceeded";
99 cutFadeOut 1;
