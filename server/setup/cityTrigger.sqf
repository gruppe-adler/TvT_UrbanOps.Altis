/*  Creates trigger, that checks who is in control of the city
*
*   executed on server via server\setup\chosenSpawnListener.sqf
*/

waitUntil {!isNil "CITYPOSITION"};
waitUntil {!isNil "CITYAREASIZE"};

_condition = "
  (west countSide thisList)/((east countSide thisList) max 1) >= CONTROLRATIO;
";

_onActivation = "
  BLUFORINCONTROL = true; publicVariable 'BLUFORINCONTROL';
";

_onDeactivation = "
  BLUFORINCONTROL = false; publicVariable 'BLUFORINCONTROL';
";

cityTrigger = createTrigger ["EmptyDetector", CITYPOSITION];
cityTrigger setTriggerArea [CITYAREASIZE,CITYAREASIZE,0,false];
cityTrigger setTriggerActivation ["ANY", "PRESENT", true];
cityTrigger setTriggerStatements [_condition,_onActivation,_onDeactivation];

diag_log "cityTrigger.sqf - Done.";
