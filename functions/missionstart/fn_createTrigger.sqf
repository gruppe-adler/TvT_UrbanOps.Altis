#define PREFIX uo
#define COMPONENT missionstart
#include "\x\cba\addons\main\script_macros_mission.hpp"

if (!isServer) exitWith {};

//city trigger =================================================================
_condition = "
    ((west countSide thisList) max 0.01)/((east countSide thisList) max 0.1) >= uo_missionParam_CONTROLRATIO;
";

_onActivation = "
    BLUFORINCONTROL = true;
    publicVariable 'BLUFORINCONTROL';
    [east,'Report','BLUFOR has taken control!'] remoteExec ['uo_common_fnc_sideNotification',0,false];
";

_onDeactivation = "
    BLUFORINCONTROL = false;
    publicVariable 'BLUFORINCONTROL';
    [east,'Report','BLUFOR is no longer in control.'] remoteExec ['uo_common_fnc_sideNotification',0,false];
";

_trigger = createTrigger ["EmptyDetector", CITYPOSITION, false];
_trigger setTriggerArea [CITYAREASIZE,CITYAREASIZE,0,false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [_condition,_onActivation,_onDeactivation];
_trigger setTriggerTimeout [5,10,20,true];

missionNamespace setVariable ["uo_init_triggerCreated", true, true];

INFO_1("City trigger created: %1.", _trigger);
