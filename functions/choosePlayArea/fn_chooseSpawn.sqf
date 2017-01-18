if (!hasInterface) exitWith {};
if (player getVariable ["originalSide", "UNKNOWN"] != "WEST") exitWith {};


[{!isNull (findDisplay 46)}, {
    openMap [true, true];
    [] call uo_choosePlayArea_fnc_bluforWaitDialog;
}, []] call CBA_fnc_waitUntilAndExecute;


if (isNil "bluforcommander") exitWith {};
if (player != bluforcommander) exitWith {};


[{SETUPTIMEREMAINING <= 0}, {
    ["Blufor Commander %1 is now choosing a city.", profileName] call uo_common_fnc_serverLog;

    //MAPCLICK EVENT ===============================================================
    mcd_chooseSpawnClick = [
        "mcd_chooseSpawn",
        "onMapSingleClick",
        {
            [WEST,"spawnMarker",true,_pos,"hd_start","COLORWEST"] call uo_common_fnc_createSideMarker;
            BLUFORSPAWN = _pos;
        }
    ] call BIS_fnc_addStackedEventHandler;

    //CONFIRM SELECTION ============================================================
    mcd_onSpawnKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {
        if ((_this select 1 == 28)||(_this select 1 == 156)) then {
            if (isNil "BLUFORSPAWN") then {
                ["PLEASE CHOOSE A SPAWN POSITION BY CLICKING ON THE MAP"] call uo_ui_fnc_confirmHint;

            } else {

                //position not in blue area
                if (CHOSENLOCATION distance BLUFORSPAWN < BLUFORSTARTDIST) then {
                    ["PLEASE CHOOSE A SPAWN POSITION OUTSIDE THE BLACK CIRCLE"] call uo_ui_fnc_confirmHint;
                } else {

                    //position in water
                    if (surfaceIsWater BLUFORSPAWN) then {
                        ["PLEASE CHOOSE A SPAWN POSITION ON LAND"] call uo_ui_fnc_confirmHint;
                    } else {

                        //position successfully chosen
                        ["fn_chooseSpawn - %1 chose spawn at %2.", profileName, BLUFORSPAWN] call uo_common_fnc_serverLog;

                        player say "taskSucceeded";
                        [true,"SETTING UP SPAWN","PLEASE WAIT"] call uo_ui_fnc_twoLineHint;

                        uo_init_spawnChosen = true;
                        publicVariable "uo_init_spawnChosen";
                        publicVariable "BLUFORSPAWN";

                        [WEST,"STARTDISTMARKER"] call uo_common_fnc_deleteSideMarker;
                        [WEST,"STARTDISTMARKER_TEXT"] call uo_common_fnc_deleteSideMarker;
                        [WEST,"CAPTUREMARKER_TEXT"] call uo_common_fnc_deleteSideMarker;
                        [WEST,"RESPAWNMARKER_TEXT"] call uo_common_fnc_deleteSideMarker;
                        [WEST,"STARTDISTMARKER_ARROW1"] remoteExec ["uo_common_fnc_deleteArrowMarkerSide",0,false];
                        [WEST,"CAPTUREMARKER_ARROW1"] remoteExec ["uo_common_fnc_deleteArrowMarkerSide",0,false];
                        [WEST,"CAPTUREMARKER_ARROW2"] remoteExec ["uo_common_fnc_deleteArrowMarkerSide",0,false];
                        [WEST,"RESPAWNMARKER_ARROW1"] remoteExec ["uo_common_fnc_deleteArrowMarkerSide",0,false];
                        [WEST,"RESPAWNMARKER_ARROW2"] remoteExec ["uo_common_fnc_deleteArrowMarkerSide",0,false];

                        ["mcd_chooseSpawn", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
                        (findDisplay 46) displayRemoveEventHandler ["KeyDown", mcd_onSpawnKeyDown];
                    };
                };
            };
        };
    }];
}, []] call CBA_fnc_waitUntilAndExecute;
