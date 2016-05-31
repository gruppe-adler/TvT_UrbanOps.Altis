/*  Creates triggers that check city control and status of command vehicle
*
*   executed on server via server\setup\chosenSpawnListener.sqf
*/

waitUntil {!isNil "CITYPOSITION"};
waitUntil {!isNil "CITYAREASIZE"};

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

cityTrigger = createTrigger ["EmptyDetector", CITYPOSITION];
cityTrigger setTriggerArea [CITYAREASIZE,CITYAREASIZE,0,false];
cityTrigger setTriggerActivation ["ANY", "PRESENT", true];
cityTrigger setTriggerStatements [_condition,_onActivation,_onDeactivation];

diag_log format ["createTriggers.sqf - city trigger created: %1", cityTrigger];

//blufor inner trigger =========================================================
waitUntil {!isNil "COMMANDVEHICLE"};

_condition = "
  COMMANDVEHICLE in thisList;
";

_onActivation = "
  CVININNER = true;
  publicVariable 'CVININNER';
";

_onDeactivation = "
  CVININNER = false;
  publicVariable 'CVININNER';
";

_trigger = createTrigger ["EmptyDetector", CITYPOSITION];
_trigger setTriggerArea [BLUFORSPAWNDIST,BLUFORSPAWNDIST,0,false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [_condition,_onActivation,_onDeactivation];

diag_log format ["createTriggers.sqf - inner trigger created: %1", _trigger];

//blufor outer trigger =========================================================
_condition = "
  COMMANDVEHICLE in thisList;
";

_onActivation = "
  CVINOUTER = true;
  publicVariable 'CVINOUTER';
";

_onDeactivation = "
  CVINOUTER = false;
  publicVariable 'CVINOUTER';
";

_trigger = createTrigger ["EmptyDetector", CITYPOSITION];
_trigger setTriggerArea [BLUFORSPAWNDIST+BLUFORSPAWNBAND,BLUFORSPAWNDIST+BLUFORSPAWNBAND,0,false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [_condition,_onActivation,_onDeactivation];

diag_log format ["createTriggers.sqf - outer trigger created: %1", _trigger];

//commandvehicle active trigger=================================================
_condition = "
  !CVININNER && CVINOUTER && (speed COMMANDVEHICLE < 3);
";

_onActivation = "
  CVACTIVE = true;
  publicVariable 'CVACTIVE';
";

_onDeactivation = "
  CVACTIVE = false;
  publicVariable 'CVACTIVE';
";

_trigger = createTrigger ["EmptyDetector", CITYPOSITION];
_trigger setTriggerArea [BLUFORSPAWNDIST+BLUFORSPAWNBAND,BLUFORSPAWNDIST+BLUFORSPAWNBAND,0,false];
_trigger setTriggerActivation ["ANY", "PRESENT", true];
_trigger setTriggerStatements [_condition,_onActivation,_onDeactivation];

diag_log format ["createTriggers.sqf - cvactive trigger created: %1", _trigger];
