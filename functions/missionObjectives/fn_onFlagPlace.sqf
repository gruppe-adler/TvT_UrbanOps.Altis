#define PREFIX uo
#define COMPONENT missionObjectives
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_flag","_placer"];

private _area = (uo_flagPositionAreas select {_flag distance2D _x < uo_FLAGRADIUS * 1.15}) select 0;
if (isNil "_area") exitWith {ERROR_2("Flag at %1 placed by %2 is not in a flagarea.",getPos _flag,name _placer)};

if (_area getVariable ["uo_flagPlaced",false]) exitWith {};
_area setVariable ["uo_flagPlaced",true,true];

[WEST,_area getVariable ["uo_flagAreaMarker",""]] call uo_common_fnc_deleteSideMarker;
[_area getVariable ["uo_flagAreaMarkerTask",""],"SUCCEEDED",true] spawn BIS_fnc_taskSetState;

private _timeForFlag = uo_missionParam_DEFENSETIME/12;
uo_endings_defenseTimeLeft = uo_endings_defenseTimeLeft + _timeForFlag;

[WEST,'Flag placed',format ['%1/%2 flags placed. +%3 min defense time',{(_x getVariable ["uo_flagPlaced",false])} count uo_flagPositionAreas,count uo_flagPositionAreas,round (_timeForFlag/60)]] remoteExec ['uo_common_fnc_sideNotification',0,false];
