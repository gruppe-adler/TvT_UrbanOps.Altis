#define PREFIX uo
#define COMPONENT missionObjectives
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_flag","_placer"];

private _area = (uo_flagPositionAreas select {_flag inArea _x}) select 0;
if (isNil "_area") exitWith {ERROR_2("Flag at %1 placed by %2 is not in a flagarea.",getPos _flag,name _placer)};

if (_area getVariable ["uo_flagPlaced",false]) exitWith {};
_area setVariable ["uo_flagPlaced",true,true];

[WEST,_area getVariable ["uo_flagAreaMarker",""],true,getPos _area,"hd_dot","COLORGREEN","","ELLIPSE",uo_FLAGRADIUS] call uo_common_fnc_createSideMarker;
[WEST,_area getVariable ["uo_flagAreaMarkerText",""],true,getPos _area,"hd_dot","COLORGREEN","flag (placed)"] call uo_common_fnc_createSideMarker;


private _timeForFlag = uo_missionParam_DEFENSETIME/12;
uo_endings_defenseTimeLeft = uo_endings_defenseTimeLeft + _timeForFlag;

[WEST,'Flag placed',format ['%1/%2 flags placed. +%3 min defense time',{(_x getVariable ["uo_flagPlaced",false])} count uo_flagPositionAreas,count uo_flagPositionAreas,round (_timeForFlag/60)]] remoteExec ['uo_common_fnc_sideNotification',0,false];
