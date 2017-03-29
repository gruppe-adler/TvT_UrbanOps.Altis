params ["_friend"];

private _foe = if (_friend == WEST) then {EAST} else {WEST};
INDEPENDENT setFriend [_foe,0];
_foe setFriend [INDEPENDENT,0];
INDEPENDENT setFriend [_friend,1];
_friend setFriend [INDEPENDENT,1];
