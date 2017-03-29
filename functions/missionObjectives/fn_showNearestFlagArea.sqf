params [["_flag",objNull]];

//show
if (isNull _flag) exitWith {};

private _nearestArea = objNull;
private _nearestDistance = 150;
{
    _distance = _x distance2D player;
    if (_distance < _nearestDistance) then {
        _nearestDistance = _distance;
        _nearestArea = _x;
    };

    false
} count uo_flagPositionAreas;
if (isNull _nearestArea) exitWith {};

private _areaCenter = getPos _nearestArea;
private _areaHeight = ((AGLToASL _areaCenter) select 2)+1;
private _linepoints = [];
for [{_i=0}, {_i<=360}, {_i=_i+5}] do {
    _pos = _areaCenter getPos [uo_FLAGRADIUS,_i];
    _linepoints pushBack (ASLToAGL [_pos select 0, _pos select 1, _areaHeight]);
};

private _onEachFrame = {
    params ["_args","_handle"];
    _args params ["_flag","_linepoints"];

    if (isNull _flag) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
    for [{_i=0}, {_i< (count _linepoints)-1}, {_i=_i+1}] do {
        drawLine3D [_linepoints select _i,_linepoints select (_i+1),[0,0,1,1]];
    };
};
[_onEachFrame , 0, [_flag,_linepoints]] call CBA_fnc_addPerFrameHandler;
