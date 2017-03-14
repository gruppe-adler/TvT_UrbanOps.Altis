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

private _flagsLeft = {!(_x getVariable ["uo_flagPlaced",false])} count uo_flagPositionAreas;
private _notificationText = if (_flagsLeft > 0) then {format ["A flag has been placed. %1 more to go.",_flagsLeft]} else {"All flags have been placed!"};
[WEST,'Flag placed',_notificationText] remoteExec ['uo_common_fnc_sideNotification',0,false];
