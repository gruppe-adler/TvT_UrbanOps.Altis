/*  Saves text under a category and diag_logs it line per line
*
*/

params ["_mode", "_category", ["_text", ""]];
_varName = "mcd_diagReport_" + _category;

switch (_mode) do {
  case "LOG": {
    if (isNil _varName) then {missionNamespace setVariable [_varName, []]};
    _report = missionNamespace getVariable [_varName, []];
    _report pushBack _text;
  };

  case "PRINT": {
    if (isNil _varName) exitWith {diag_log format ["fn_diagReport - %1 is not an existing category.", _category]};
    diag_log format ["%1 REPORT ================================================", _category];
    {
      if (typeName _x != "STRING") then {
        diag_log str _x;
      } else {
        diag_log _x;
      };
    } forEach _varName;
    diag_log format ["END OF %1 REPORT =========================================", _category];
  };
};
