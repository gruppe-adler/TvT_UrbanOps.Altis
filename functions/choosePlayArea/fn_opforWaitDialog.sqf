if (!hasInterface) exitWith {};

_isCommander = false;
if (!isNil "opforcommander") then {_isCommander = (player == opforcommander)};

if (_isCommander) then {
  titleRsc ["chooseCityGUI", "PLAIN", 1, true];
} else {
  if (side player == EAST) then {
    titleRsc ["opforwaitmessage", "PLAIN", 1, true];
  } else {
    titleRsc ["bluforWaitMessage1", "PLAIN", 1, true];
  };
};
