#include "..\..\ui_toolkit.hpp"
#include "..\defines.hpp"

params ["_picturePath", "_text", "_sound"];

if (!hasInterface) exitWith {};
if (uiNamespace getVariable ["uo_animatedHint_running", false]) exitWith {};

if (!isNil "_sound") then {
    player say2D _sound;
};

titleRsc ["uo_animatedHint", "PLAIN", 0, true];
uiNamespace setVariable ["uo_animatedHint_running",true];

disableSerialization;
_animatedHintDisplay = uiNamespace getVariable "uo_animatedHint";

_bgCtrl = _animatedHintDisplay displayCtrl uo_animatedHint_BACKGROUND;
_picCtrl = _animatedHintDisplay displayCtrl uo_animatedHint_PICTURE;
_textCtrl = _animatedHintDisplay displayCtrl uo_animatedHint_TEXT;

_picCtrl ctrlSetText _picturePath;
_textCtrl ctrlSetText _text;

_xScale = X_SCALE;
{
    _curPos = ctrlPosition _x;
    _x ctrlSetPosition [(_curPos select 0) - (0.23 * _xScale), uo_animatedHint_Y];
    _x ctrlCommit 0.5;
} forEach [_bgCtrl,_picCtrl,_textCtrl];


[{
    params ["_bgCtrl","_picCtrl","_textCtrl"];

    _xScale = X_SCALE;
    {
        _curPos = ctrlPosition _x;
        _x ctrlSetPosition [(_curPos select 0) + (0.23 * _xScale), uo_animatedHint_Y];
        _x ctrlCommit 0.5;
    } forEach [_bgCtrl,_picCtrl,_textCtrl];

    [{
        titleRsc ["Default", "PLAIN"];
        uiNamespace setVariable ["uo_animatedHint_running",false];
    },[],1] call CBA_fnc_waitAndExecute;

}, [_bgCtrl,_picCtrl,_textCtrl], 5] call CBA_fnc_waitAndExecute;
