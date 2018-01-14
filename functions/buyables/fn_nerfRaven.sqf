/* Disables thermal imaging of Raven drone
*
* Executed via init.sqf:
* [] execVM "helpers\nerfRaven.sqf"
*/

if !(hasInterface) exitWith {};

// Executed on any keydown while GCS camera feed is open
UO_buyables_raven_onKeyDown = {
	_dikCode = (_this select 0) select 1;

	// N-key
	if (_dikCode == 49) then {

		player say "3DEN_notificationWarning";
		hint localize "str_UO_ravenError1";

		(findDisplay 46) displayRemoveEventHandler ["KeyDown", TI_deh];
		[{
			params ["_startTime","_handle"];

			if (CBA_missionTime - _startTime > 3) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

			TI_activeGCS setVariable ["mavCameraOn",0,false];
			TI_activeGCS setVariable ["mavVisionMode",0,true];
		},0.5,CBA_missionTime] call CBA_fnc_addPerFrameHandler;
	};

	// G-key
	if (_dikCode == 34) then {
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", TI_deh];
	};
};

// Executed when any addaction-action is performed
UO_buyables_raven_onAction = "
	_actionDesc = _this select 4;
	TI_activeGCS = _this select 0;

	_actionDescArray = _actionDesc splitString ' ';
	_firstWord = _actionDescArray select 0;
	_secondWord = _actionDescArray select 1;

	if (_actionDesc == '   MINICAM: MODE') then {
		player setVariable ['miniCamMode',-1,false];
		miniCamOn = [-1] call BIS_fnc_liveFeedEffects;
		player say '3DEN_notificationWarning';
		hint localize 'str_UO_ravenError2';
	};

	if ((_firstWord == 'CAMERA') && (_secondWord == 'FEED')) then {
		TI_deh = (findDisplay 46) displayAddEventHandler ['KeyDown', '[_this] call UO_buyables_raven_onKeyDown'];
	};
	false;
";

// Add Eventhandler to player
inGameUISetEventHandler ["Action", UO_buyables_raven_onAction];
