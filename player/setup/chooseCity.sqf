/*  Lets OPFOR commander choose city
*
*   executed via initPlayerLocal
*/

waitUntil {!isNil "originalSide"};
if (originalSide != "EAST") exitWith {};
waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {!isNil "VILLAGEMARKERSIZE" && !isNil "CITYMARKERSIZE" && !isNil "CAPITALMARKERSIZE" && !isNil "OTHERMARKERSIZE"};
waitUntil {!isNull (findDisplay 46)};
openMap [true, false];

[] execVM "player\setup\opforWaitDialog.sqf";

if (isNil "opforcommander") exitWith {};
if (player != opforcommander) exitWith {};

diag_log "chooseCity.sqf starting...";

//MAPCLICK EVENT ===============================================================
mcd_chooseCityClick = [
  "mcd_chooseCity",
  "onMapSingleClick",
  {
    //find nearest location
    _clickRadius = ([VILLAGEMARKERSIZE,CITYMARKERSIZE,CAPITALMARKERSIZE,OTHERMARKERSIZE] call BIS_fnc_greatestNum) + 100;
    CHOSENLOCATION = (nearestLocations [_pos, ["NameVillage", "NameCity", "NameCityCapital", "NameLocal"], _clickRadius]) select 0;
    _drawRadius = switch (type CHOSENLOCATION) do {
      case "NameVillage": {VILLAGEMARKERSIZE};
      case "NameCity": {CITYMARKERSIZE};
      case "NameCityCapital": {CAPITALMARKERSIZE};
      case "NameLocal": {OTHERMARKERSIZE};
    };
    diag_log format ["chooseCity.sqf - Player clicked on %1", text CHOSENLOCATION];

    //create marker
    if (!isNil "CHOSENLOCATION") then {
      [locationPosition CHOSENLOCATION,_drawRadius] spawn {
        params ["_pos","_drawRadius"];
        [EAST,"selectionMarker"] call mcd_fnc_deleteSideMarker;
        sleep 0.3;
        [EAST,"selectionMarker",_pos,"hd_start","ColorGreen","","ELLIPSE",_drawRadius,0.35,"Solid"] call mcd_fnc_createSideMarker;
      };
    };
  }
] call BIS_fnc_addStackedEventHandler;

//CONFIRM SELECTION ============================================================
mcd_onCityKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {
  if ((_this select 1 == 28)||(_this select 1 == 156)) then {
    diag_log "chooseCity.sqf - Player pressed enter...";

    if (isNil "CHOSENLOCATION") then {
      diag_log "chooseCity.sqf - ...but did not choose a location";
      createDialog "chooseCityErrorMessage";
    } else {

      diag_log format ["chooseCity.sqf - ...and chose location %1", text CHOSENLOCATION];

      deleteMarkerLocal "selectionMarker";

      CITYCHOSEN = true;
      publicVariable "CITYCHOSEN";
      publicVariable "CHOSENLOCATION";

      ["mcd_chooseCity", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
      (findDisplay 46) displayRemoveEventHandler ["KeyDown", mcd_onCityKeyDown];
    };
  };
}];
