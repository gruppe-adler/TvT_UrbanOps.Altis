if (!hasInterface) exitWith {};
if (player getVariable ["originalSide", "UNKNOWN"] != "EAST") exitWith {};


[{!isNull (findDisplay 46)}, {
    /* [true] call uo_choosePlayArea_fnc_showWeatherPreview; */
    [3,{uo_choosePlayArea_preloadFinished = true}] call uo_common_fnc_wait3Dframes;
}, []] call CBA_fnc_waitUntilAndExecute;

[{!isNull (findDisplay 46) && (missionNamespace getVariable ["uo_choosePlayArea_preloadFinished",false])}, {

    if (missionNamespace getVariable ["uo_init_cityChosen", false]) exitWith {};

    openMap [true, true];
    [] call uo_choosePlayArea_fnc_opforWaitDialog;

    if (isNil "opforcommander") exitWith {};
    if (player != opforcommander) exitWith {};

    ["Opfor Commander %1 is now choosing a city.", profileName] call uo_common_fnc_serverLog;

    //MAPCLICK EVENT ===============================================================
    mcd_chooseCityClick = [
        "mcd_chooseCity",
        "onMapSingleClick",
        {
            //find nearest location
            _clickRadius = ([VILLAGEMARKERSIZE,CITYMARKERSIZE,CAPITALMARKERSIZE,OTHERMARKERSIZE] call BIS_fnc_greatestNum) + 100;
            _nearestLocations = nearestLocations [_pos, ["NameVillage", "NameCity", "NameCityCapital", "NameLocal"], _clickRadius];
            CHOSENLOCATION =  locationNull;
            {
                if (_x in LOCATION_ALLVILLAGES || _x in LOCATION_ALLCITIES || _x in LOCATION_ALLCAPITALS || _x in LOCATION_ALLOTHER) exitWith {
                    CHOSENLOCATION = _x;
                };
                false
            } count _nearestLocations;

            _drawRadius = switch (type CHOSENLOCATION) do {
                case "NameVillage": {VILLAGEMARKERSIZE};
                case "NameCity": {CITYMARKERSIZE};
                case "NameCityCapital": {CAPITALMARKERSIZE};
                case "NameLocal": {OTHERMARKERSIZE};
            };

            ["fn_chooseCity - %1 clicked on %2", profileName, text CHOSENLOCATION] call uo_common_fnc_serverLog;

            //create marker
            if (!isNull CHOSENLOCATION) then {
                [EAST,"selectionMarker",true,getPos CHOSENLOCATION,"hd_start","ColorGreen","","ELLIPSE",_drawRadius,0.45,"Solid"] call uo_common_fnc_createSideMarker;
            } else {
                [EAST,"selectionMarker"] call uo_common_fnc_deleteSideMarker;
            };
        }
    ] call BIS_fnc_addStackedEventHandler;

    //CONFIRM SELECTION ============================================================
    mcd_onCityKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {
        if ((_this select 1 == 28)||(_this select 1 == 156)) then {
            if (isNil "CHOSENLOCATION") then {
                ["PLEASE CHOOSE A LOCATION!"] call uo_ui_fnc_confirmHint;

            } else {
                ["fn_chooseCity - %1 chose location %2", profileName, text CHOSENLOCATION] call uo_common_fnc_serverLog;
                [EAST,"selectionMarker"] call uo_common_fnc_deleteSideMarker;

                player say "taskSucceeded";
                [true,"SETTING UP PLAYZONE","PLEASE WAIT"] call uo_ui_fnc_twoLineHint;

                uo_init_cityChosen = true;
                publicVariable "uo_init_cityChosen";
                publicVariable "CHOSENLOCATION";

                ["mcd_chooseCity", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
                (findDisplay 46) displayRemoveEventHandler ["KeyDown", mcd_onCityKeyDown];
            };
        };
    }];
}, []] call CBA_fnc_waitUntilAndExecute;
