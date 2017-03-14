#define PREFIX uo
#define COMPONENT missionObjectives
#include "\x\cba\addons\main\script_macros_mission.hpp"

uo_flagPositions = [];
uo_flagPositionAreas = [];

for [{_i=0}, {_i<300}, {_i=_i+1}] do {
    _pos = [CITYPOSITION, [0,CITYAREASIZE*0.50], [0,360], "Flag_Blue_F"] call uo_common_fnc_findRandomPos;
    if ({_pos distance2D _x < 100} count uo_flagPositions == 0 && !(isOnRoad _pos)) then {uo_flagPositions pushBack _pos};
    if (count uo_flagPositions == uo_FLAGAMOUNT) exitWith {};
};

if (count uo_flagPositions < uo_FLAGAMOUNT) then {ERROR_2("Only %1 of %2 flag positions found.",count uo_flagPositions,uo_FLAGAMOUNT)};

{
    _areaMarkerName = format ["uo_flagmarker_%1",_forEachIndex];
    _textMarkerName = format ["uo_flagmarkerText_%1",_forEachIndex];
    [WEST,_areaMarkerName,true,_x,"hd_dot","COLORWEST","","ELLIPSE",uo_FLAGRADIUS] call uo_common_fnc_createSideMarker;
    [WEST,_textMarkerName,true,_x,"hd_dot","COLORWEST","place flag"] call uo_common_fnc_createSideMarker;
    _trigger = createTrigger ["EmptyDetector", _x, false];
    _trigger setTriggerArea [uo_FLAGRADIUS,uo_FLAGRADIUS,0,false];
    _trigger setVariable ["uo_flagAreaMarker",_areaMarkerName];
    _trigger setVariable ["uo_flagAreaMarkerText",_textMarkerName];
    uo_flagPositionAreas pushBack _trigger;
} forEach uo_flagPositions;

publicVariable "uo_flagPositionAreas";
