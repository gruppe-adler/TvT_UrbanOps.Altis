#define PREFIX uo
#define COMPONENT missionObjectives
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};

_start = diag_tickTime;
for [{_i=0}, {_i<100}, {_i=_i+1}] do {
    uo_flagPositions = [];
    uo_flagPositionAreas = [];

    for [{_i=0}, {_i<100}, {_i=_i+1}] do {
        _pos = [CITYPOSITION, [CITYAREASIZE*0.05,CITYAREASIZE*0.60], [0,360], "Flag_Blue_F"] call uo_common_fnc_findRandomPos;
        if ({_pos distance2D _x < 100} count uo_flagPositions == 0 && !(isOnRoad _pos)) then {uo_flagPositions pushBack _pos};
        if (count uo_flagPositions == uo_FLAGAMOUNT) exitWith {};
    };
    if (count uo_flagPositions == uo_FLAGAMOUNT) exitWith {};
};
_stop = diag_tickTime;

INFO_1("FLAGS TOOK %1 SECONDS",_stop-_start);

if (count uo_flagPositions < uo_FLAGAMOUNT) then {ERROR_2("Only %1 of %2 flag positions found.",count uo_flagPositions,uo_FLAGAMOUNT)};

private _taskDescription = format ["Place a flag inside the blue marker (zoom in). For each placed flag you get an additional %1 min to capture the location.<br/><br/>Use:<br/>ACE-Selfinteraction >> Equipment >> Fortifications >> Flag",round (uo_FLAGTIMEBONUS/60)];

{
    _areaMarkerName = format ["uo_flagmarker_%1",_forEachIndex];
    _textMarkerName = format ["uo_flagmarkerText_%1",_forEachIndex];
    _taskName = format ["uo_flagmarkerTask_%1",_forEachIndex];

    [WEST,_areaMarkerName,true,_x,"hd_dot","COLORWEST","","ELLIPSE",uo_FLAGRADIUS] call uo_common_fnc_createSideMarker;
    _taskID = [WEST,_taskName,[_taskDescription,"Place flag",_areaMarkerName],_x,"AUTOASSIGNED",1,false,"default"] call BIS_fnc_taskCreate;

    _trigger = createTrigger ["EmptyDetector", _x, true];
    _trigger setTriggerArea [uo_FLAGRADIUS,uo_FLAGRADIUS,0,false];
    _trigger setVariable ["uo_flagAreaMarker",_areaMarkerName,true];
    _trigger setVariable ["uo_flagAreaMarkerText",_textMarkerName,true];
    _trigger setVariable ["uo_flagAreaMarkerTask",_taskID,true];
    uo_flagPositionAreas pushBack _trigger;
} forEach uo_flagPositions;

publicVariable "uo_flagPositionAreas";
