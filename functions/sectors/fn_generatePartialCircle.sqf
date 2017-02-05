params ["_center","_radius","_angles","_circlePoints"];
_angles params ["_from","_to"];

_polygon = [_center];
_step = abs ((_to - _from)/_circlePoints);

for [{_i=_from}, {_i<=_to}, {_i=_i+_step}] do {
    _pos = _center getPos [_radius,_i];
    _polygon pushBack _pos;
};

_polygon
