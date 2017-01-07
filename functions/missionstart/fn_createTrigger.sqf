if (!isServer) exitWith {};

//city trigger =================================================================
_condition = "
    (west countSide thisList)/((east countSide thisList) max 1) >= CONTROLRATIO;
";

_onActivation = "
    BLUFORINCONTROL = true;
    publicVariable 'BLUFORINCONTROL';
    [east, ['BLUFOR','has taken control!']] remoteExec ['mcd_fnc_sideHint',0,false];
";

_onDeactivation = "
    BLUFORINCONTROL = false;
    publicVariable 'BLUFORINCONTROL';
    [east, ['BLUFOR','is no longer in control.']] remoteExec ['mcd_fnc_sideHint',0,false];
";

_trigger = createTrigger ["EmptyDetector", CITYPOSITION, false];
_trigger setTriggerArea [CITYAREASIZE,CITYAREASIZE,0,false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [_condition,_onActivation,_onDeactivation];
_trigger setTriggerTimeout [5,10,20,true];

missionNamespace setVariable ["uo_init_triggerCreated", true, true];

diag_log format ["fn_createTrigger - City trigger created: %1.", _trigger];
