if (!hasInterface) exitWith {};
if (player getVariable ["originalSide", "UNKNOWN"] != "EAST") exitWith {};


[{!isNull (findDisplay 46)}, {
    openMap [true, false];
    [] call mcd_fnc_opforWaitDialog;

    if (isNil "opforcommander") exitWith {};
    if (player != opforcommander) exitWith {};

    ["Opfor Commander %1 is now choosing a city.", profileName] call mcd_fnc_serverLog;

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

            ["fn_chooseCity - %1 clicked on %2", profileName, text CHOSENLOCATION] call mcd_fnc_serverLog;

            //create marker
            if (!isNil "CHOSENLOCATION") then {
                [EAST,"selectionMarker",true,getPos CHOSENLOCATION,"hd_start","ColorGreen","","ELLIPSE",_drawRadius,0.45,"Solid"] call mcd_fnc_createSideMarker;
            } else {
                [EAST,"selectionMarker"] call mcd_fnc_deleteSideMarker;
            };
        }
    ] call BIS_fnc_addStackedEventHandler;

    //CONFIRM SELECTION ============================================================
    mcd_onCityKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {
        if ((_this select 1 == 28)||(_this select 1 == 156)) then {
            if (isNil "CHOSENLOCATION") then {
                createDialog "chooseCityErrorMessage";

            } else {
                ["fn_chooseCity - %1 chose location %2", profileName, text CHOSENLOCATION] call mcd_fnc_serverLog;
                [EAST,"selectionMarker"] call mcd_fnc_deleteSideMarker;

                uo_init_cityChosen = true;
                publicVariable "uo_init_cityChosen";
                publicVariable "CHOSENLOCATION";

                ["mcd_chooseCity", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
                (findDisplay 46) displayRemoveEventHandler ["KeyDown", mcd_onCityKeyDown];
            };
        };
    }];
}, []] call CBA_fnc_waitUntilAndExecute;
