/*  Ends mission for player when public variable is received
*
*   executed on player via initPlayerLocal
*/

mcd_fnc_endMission = {
  params ["_winningSide", "_endText", "_var"];
  if (!_var) exitWith {};

  _winningSide = _this select 0;
  _isVictory = false;
  if (_winningSide == originalSide) then {
    _isVictory = true;
  };

  _text = format ["<img size= '6' style='vertical-align:middle' shadow='false' image='data\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>%1</t>", _endText];
  [_text,0,0,2,2] spawn BIS_fnc_dynamicText;

  sleep 5;

  ["end1", _isVictory, true, true, true] spawn BIS_fnc_endMission;
};

"CITYCAPTURED" addPublicVariableEventHandler {["WEST", "CITY CAPTURED!", _this select 1] spawn mcd_fnc_endMission};
