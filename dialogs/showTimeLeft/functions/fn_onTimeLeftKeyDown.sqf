#include "..\defines.hpp"

//uinamespace getVariable does not support default values:
if ((uiNamespace getVariable ["uo_showTimeLeft",[]]) isEqualType []) then {uiNamespace setVariable ["uo_showTimeLeft",controlNull]};

if !(isNull (uiNamespace getVariable ['uo_showTimeLeft',controlNull])) exitWith {};
"uo_timeLeftLayer" cutRsc ["uo_showTimeLeft", "PLAIN", 0, false];

[{
    params ["_args","_handle"];
    if (isNull (uiNamespace getVariable ['uo_showTimeLeft',displayNull])) exitWith {systemChat "uo_showTimeLeft is null"; [_handle] call CBA_fnc_removePerFrameHandler};

    if (visibleWatch) then {
        _opforText = format ["OPFOR defense time left: <br />%1 minutes",[missionNamespace getVariable ["uo_endings_defenseTimeLeft",uo_missionParam_DEFENSETIME],"MM:SS"] call BIS_fnc_secondsToString];
        _bluforText = if (playerSide == EAST) then {format ["BLUFOR capture time left: <br/>%1 minutes",[CAPTURETIMEREMAINING,"MM:SS"] call BIS_fnc_secondsToString]} else {""};
        _text = parseText (_opforText + "<br/><br/>" + _bluforText);

        _control = uiNamespace getVariable ['uo_showTimeLeft', controlNull];
        _control ctrlSetStructuredText _text;
    } else {
        "uo_timeLeftLayer" cutRsc ["Default", "PLAIN", 0, false];
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

}, 0, []] call CBA_fnc_addPerFrameHandler;

false
