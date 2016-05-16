mcd_fnc_startCaptureCountdown = {
  if !(_this select 0) exitWith {};
  while {BLUFORINCONTROL} do {
    _text = [CAPTURETIMEREMAINING,"MM:SS"] call BIS_fnc_secondsToString;
    [["Blufor hat die Kontrolle!"],[_text,"#00ff00"]] spawn mcd_fnc_formattedHint;
    sleep 1;
  };
};

mcd_fnc_endCaptureCountdown = {
  if (_this select 0) exitWith {};
  sleep 1;
  [["Blufor hat die"],["Kontrolle verloren!", "#ff0000"]] spawn mcd_fnc_formattedHint;
};

"BLUFORINCONTROL" addPublicVariableEventHandler {[_this select 1] spawn mcd_fnc_startCaptureCountdown; [_this select 1] spawn mcd_fnc_endCaptureCountdown};
