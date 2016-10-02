if (!hasInterface) exitWith {};
if (player getVariable ["originalSide", "UNKNOWN"] != "WEST") exitWith {};


[{!isNull (findDisplay 46)}, {
  openMap [true, false];
  [] call mcd_fnc_bluforWaitDialog;
}, []] call CBA_fnc_waitUntilAndExecute;


if (isNil "bluforcommander") exitWith {};
if (player != bluforcommander) exitWith {};


[{SETUPTIMEREMAINING <= 0}, {
  ["Blufor Commander %1 is now choosing a city.", profileName] call mcd_fnc_serverLog;

  //MAPCLICK EVENT ===============================================================
  mcd_chooseSpawnClick = [
    "mcd_chooseSpawn",
    "onMapSingleClick",
    {
      [WEST,"spawnMarker",true,_pos,"hd_start","COLORWEST"] call mcd_fnc_createSideMarker;
      BLUFORSPAWN = _pos;
    }
  ] call BIS_fnc_addStackedEventHandler;

  //CONFIRM SELECTION ============================================================
  mcd_onSpawnKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {
    if ((_this select 1 == 28)||(_this select 1 == 156)) then {
      if (isNil "BLUFORSPAWN") then {
        createDialog "spawnselectErrorMessage1";

      } else {

        //position not in blue area
        if (CHOSENLOCATION distance BLUFORSPAWN < BLUFORSPAWNDIST + BLUFORSPAWNBAND) then {
          createDialog "spawnselectErrorMessage2";
        } else {

          //position in water
          if (surfaceIsWater BLUFORSPAWN) then {
            createDialog "spawnselectErrorMessage3";
          } else {

            //position successfully chosen
            ["fn_chooseSpawn - %1 chose spawn at %2.", profileName, BLUFORSPAWN] call mcd_fnc_serverLog;

            uo_init_spawnChosen = true;
            publicVariable "uo_init_spawnChosen";
            publicVariable "BLUFORSPAWN";

            [WEST,"EXPLANATIONMARKER_CAPTURE"] call mcd_fnc_deleteSideMarker;
            [WEST,"EXPLANATIONMARKER_CAPTURE_TEXT"] call mcd_fnc_deleteSideMarker;
            [WEST,"EXPLANATIONMARKER_RESPAWN"] call mcd_fnc_deleteSideMarker;
            [WEST,"EXPLANATIONMARKER_RESPAWN_TEXT"] call mcd_fnc_deleteSideMarker;

            ["mcd_chooseSpawn", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
            (findDisplay 46) displayRemoveEventHandler ["KeyDown", mcd_onSpawnKeyDown];
          };
        };
      };
    };
  }];
}, []] call CBA_fnc_waitUntilAndExecute;
