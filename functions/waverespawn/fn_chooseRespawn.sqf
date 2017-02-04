params ["_group"];

if !(hasInterface) exitWith {};
if !(player in (units _group)) exitWith {};

if (leader _group != player) then {
    [playerSide,"Teamlead is choosing respawn."] call uo_waverespawn_fnc_respawnHint;
} else {
    hint "";

    ["Terminate"] call BIS_fnc_EGSpectator;
    [false] call uo_waverespawn_fnc_blockMap;
    openMap [true, true];

    [true, "CHOOSE RESPAWN LOCATION", "CONFIRM (ENTER)"] call uo_ui_fnc_twoLineHint;

    //MAPCLICK EVENT ===============================================================
    mcd_chooseRespawnClick = [
        "mcd_chooseRespawn",
        "onMapSingleClick",
        {
            if (playerSide == WEST) then {
                _respawnObject = [_pos, 300, player getVariable ["originalSide", "UNKNOWN"]] call uo_waverespawn_fnc_findNearestRespawnObject;
                [_respawnObject] call uo_waverespawn_fnc_respawnSelectorMarker;
            };

            if (playerSide == EAST) then {

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
                [group player,getPos uo_selectedRespawnObject] remoteExec ["uo_waverespawn_fnc_respawnGroup",0,false];
                openMap [false, false];

            };
        };
    }];
};
