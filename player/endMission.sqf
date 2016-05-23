/*  Ends mission for player when public variable is received
*
*   executed on player via initPlayerLocal
*/

endInProgress = false;

mcd_fnc_endMission = {
  params ["_winningSide", "_endText", "_var"];

  //only execute if variable, this EH is attached to, is true
  if (!_var) exitWith {};

  //make sure two of these dont run at the same time
  if (endInProgress) exitWith {diag_log "fnc_endMission - A different ending is already in progress."};
  endInProgress = true;

  _isVictory = false;
  if (_winningSide == originalSide) then {
    _isVictory = true;
  };

  _winningText = switch (_winningSide) do {
    case "WEST": {"BLUFOR WINS"};
    case "EAST": {"OPFOR WINS"};
  };

  _text = format ["<img size= '6' style='vertical-align:middle' shadow='false' image='data\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>%1<br/>%2</t>", _endText, _winningText];
  [_text,0,0,2,2] spawn BIS_fnc_dynamicText;

  sleep 5;

  ["end1", _isVictory, true, true, true] spawn BIS_fnc_endMission;
};

"CITYCAPTURED" addPublicVariableEventHandler {["WEST", "CITY CAPTURED!", _this select 1] spawn mcd_fnc_endMission};
"CITYDEFENDED" addPublicVariableEventHandler {["EAST", "CITY DEFENDED!", _this select 1] spawn mcd_fnc_endMission};
"BLUFORELIMINATED" addPublicVariableEventHandler {["EAST", "BLUFOR ELIMINATED!", _this select 1] spawn mcd_fnc_endMission};
