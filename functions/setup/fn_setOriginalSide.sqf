if (!hasInterface) exitWith {};

private ["_originalSide"];

while {isNil "_originalSide"} do {
  if (!isNull player && player == player) then {
    _originalSide = str side player;
  };
};

player setVariable ["originalSide", _originalSide];
