[false] call uo_waverespawn_fnc_blockMap;
openMap [true, false];

[true, "CHOOSE RESPAWN LOCATION", "CONFIRM (ENTER)"] call uo_ui_fnc_twoLineHint;

//MAPCLICK EVENT ===============================================================
mcd_chooseRespawnClick = [
    "mcd_chooseRespawn",
    "onMapSingleClick",
    {
        _respawnObject = [_pos, 300, player getVariable ["originalSide", "UNKNOWN"]] call uo_chooseRespawn_fnc_findNearestRespawnObject;
        uo_selectedRespawnObject = _respawnObject;

        if (isNull _respawnObject || !(_respawnObject getVariable ["uo_respawnObject_isActive", false])) then {
            [objNull] call uo_chooseRespawn_fnc_respawnSelectorMarker;
        } else {
            [_respawnObject] call uo_chooseRespawn_fnc_respawnSelectorMarker;
        };
    }
] call BIS_fnc_addStackedEventHandler;

//CONFIRM SELECTION ============================================================
mcd_onRespawnKeyDown = (findDisplay 46) displayAddEventHandler ["KeyUp", {
    if ((_this select 1) == 28 || (_this select 1) == 156) then {

        if (isNull (missionNamespace getVariable ["uo_selectedRespawnObject",objNull])) then {
            ["PLEASE SELECT YOUR RESPAWN POSITION"] call uo_ui_fnc_confirmHint;


        } else {
            ["mcd_chooseRespawn", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
            (findDisplay 46) displayRemoveEventHandler ["KeyDown", mcd_onRespawnKeyDown];

            [false] call uo_ui_fnc_twoLineHint;
            [objNull] call uo_chooseRespawn_fnc_respawnSelectorMarker;
            openMap [false, false];
            [] call uo_waverespawn_fnc_doRespawn;
        };
    };
}];
