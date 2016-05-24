/*  Lets BLUFOR commander choose spawn
*
*   executed via initPlayerLocal
*/

waitUntil {!isNil "originalSide"};
if (originalSide != "WEST") exitWith {};
waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {!isNull (findDisplay 46)};
openMap [true, false];

[] execVM "player\setup\bluforWaitDialog.sqf";
waitUntil {!isNil "SETUPTIMEREMAINING"};
waitUntil {SETUPTIMEREMAINING <= 0};

if (isNil "bluforcommander") exitWith {};
if (player != bluforcommander) exitWith {};

waitUntil {!isNil "BLUFORSPAWNDIST" && !isNil "BLUFORSPAWNBAND"};
waitUntil {!isNil "CITYPOSITION"};

diag_log "chooseSpawn.sqf starting...";

//MAPCLICK EVENT ===============================================================
mcd_chooseSpawnClick = [
  "mcd_chooseSpawn",
  "onMapSingleClick",
  {
    [_pos] spawn {
      params ["_pos"];
      [WEST,"spawnMarker"] call mcd_fnc_deleteSideMarker;
      sleep 0.3;
      [WEST,"spawnMarker",_pos,"hd_start","COLORWEST"] call mcd_fnc_createSideMarker;

      BLUFORSPAWN = _pos;
    };
  }
] call BIS_fnc_addStackedEventHandler;

//CONFIRM SELECTION ============================================================
mcd_onSpawnKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {
  if ((_this select 1 == 28)||(_this select 1 == 156)) then {
    diag_log "chooseSpawn.sqf - Player pressed enter...";

    //did not choose position
    if (isNil "BLUFORSPAWN") then {
      diag_log "chooseSpawn.sqf - ...but did not choose a spawnposition.";
      createDialog "spawnselectErrorMessage1";
    } else {

      //position not in blue area
      if (CHOSENLOCATION distance BLUFORSPAWN < BLUFORSPAWNDIST || CHOSENLOCATION distance BLUFORSPAWN > BLUFORSPAWNDIST + BLUFORSPAWNBAND) then {
        diag_log "chooseSpawn.sqf - ...but spawnposition is not in spawn area.";
        createDialog "spawnselectErrorMessage2";
      } else {

        //position in water
        if (surfaceIsWater BLUFORSPAWN) then {
          diag_log "chooseSpawn.sqf - ...but spawnposition is in water.";
          createDialog "spawnselectErrorMessage3";
        } else {

          //position successfully chosen
          diag_log format ["chooseSpawn.sqf - ...and chose a spawnposition!"];

          SPAWNCHOSEN = true;
          publicVariable "SPAWNCHOSEN";
          publicVariable "BLUFORSPAWN";

          ["mcd_chooseSpawn", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
          (findDisplay 46) displayRemoveEventHandler ["KeyDown", mcd_onSpawnKeyDown];
        };
      };
    };
  };
}];
