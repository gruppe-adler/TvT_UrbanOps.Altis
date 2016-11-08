params ["_house"];

_allPositions = [];
for [{_i=0}, {_i<200}, {_i=_i+1}] do {
    _bPos = _house buildingpos _i;
	if (str _bPos == "[0,0,0]") exitWith {};
	_allPositions pushBack _bPos;
};

_allPositions
