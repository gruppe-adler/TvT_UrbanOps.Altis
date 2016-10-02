if (!isServer) exitWith {};

//city trigger =================================================================
_condition = "
  (west countSide thisList)/((east countSide thisList) max 1) >= CONTROLRATIO;
";

_onActivation = "
  BLUFORINCONTROL = true;
  publicVariable 'BLUFORINCONTROL';
";

_onDeactivation = "
  BLUFORINCONTROL = false;
  publicVariable 'BLUFORINCONTROL';
";

_trigger = createTrigger ["EmptyDetector", CITYPOSITION, false];
_trigger setTriggerArea [CITYAREASIZE,CITYAREASIZE,0,false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [_condition,_onActivation,_onDeactivation];

missionNamespace setVariable ["uo_init_triggerCreated", true, true];

diag_log format ["fn_createTrigger - City trigger created: %1.", _trigger];
