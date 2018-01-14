params ["_group"];

if !(hasInterface) exitWith {};
if !(player in (units _group)) exitWith {};

hint "";
if (leader _group != player) exitWith {
    [playerSide,"Teamlead is choosing respawn."] call uo_waverespawn_fnc_respawnHint;
};

if (side _group == WEST && count (missionNamespace getVariable ["uo_cv_allCVs",[]]) < 2) exitWith {[_group,getPos (uo_cv_allCVs select 0)] remoteExec ["uo_waverespawn_fnc_respawnGroup",2,false]};
if (side _group == EAST && uo_missionParam_OPFORRESPAWNMODE == 2) exitWith {[_group,CITYPOSITION] remoteExec ["uo_waverespawn_fnc_respawnGroup",2,false]};

["Terminate"] call BIS_fnc_EGSpectator;
[false] call uo_waverespawn_fnc_blockMap;
if (playerSide == EAST) then {[true] call uo_sectors_fnc_drawSectors};
openMap [true, true];

_zoom = if (side _group == WEST) then {0.12} else {0.02};
_map = (findDisplay 12) displayCtrl 51;
_map ctrlMapAnimAdd [0,_zoom,CITYPOSITION];
ctrlMapAnimCommit _map;


//TIMEOUT HINT =================================================================
_startTime = serverTime;
[{
    params ["_startTime","_handle"];
    _timeLeft = AUTOCHOOSETIMEOUT - (serverTime - _startTime);
    if (group player getVariable ["uo_waverespawn_groupIsRespawned",false]) exitWith {
        [false] call uo_ui_fnc_twoLineHint;
        [_handle] call CBA_fnc_removePerFrameHandler
    };
    [true, format ["CHOOSE RESPAWN LOCATION (%1s left)",(round _timeLeft) max 0], "CONFIRM WITH ENTER"] call uo_ui_fnc_twoLineHint;
    if (_timeLeft < 0) exitWith {
        [false] call uo_ui_fnc_twoLineHint;
        [_handle] call CBA_fnc_removePerFrameHandler
    };
} , 1, _startTime] call CBA_fnc_addPerFrameHandler;


//MAPCLICK EVENT ===============================================================
mcd_chooseRespawnClick = [
    "mcd_chooseRespawn",
    "onMapSingleClick",
    {
        if (playerSide == WEST) then {
            _respawnObject = [_pos, 300, player getVariable ["originalSide", "UNKNOWN"]] call uo_waverespawn_fnc_findNearestRespawnObject;
            if (_respawnObject getVariable ["uo_respawnObject_isActive", false]) then {
                [WEST,_respawnObject] call uo_waverespawn_fnc_respawnSelectorMarker;
            };
        };

        if (playerSide == EAST) then {
            _sectorID = [_pos] call uo_sectors_fnc_getSector;
            if (_sectorID != -1 && !(surfaceIsWater _pos)) then {
                [EAST,_sectorID,_pos] call uo_waverespawn_fnc_respawnSelectorMarker;
            } else {
                [EAST,-1] call uo_waverespawn_fnc_respawnSelectorMarker;
            };
        };
    }
] call BIS_fnc_addStackedEventHandler;


//CONFIRM SELECTION ============================================================
mcd_onRespawnKeyDown = (findDisplay 46) displayAddEventHandler ["KeyUp", {
    if ((_this select 1) != 28 && (_this select 1) != 156) exitWith {};

    _condition = if (playerSide == WEST) then {
        isNull (missionNamespace getVariable ["uo_selectedRespawnObject",objNull]);
    } else {
        (missionNamespace getVariable ["uo_selectedRespawnPos",[0,0,0]]) isEqualTo [0,0,0];
    };

    if (_condition) then {
        if (playerSide == WEST) then {["PLEASE SELECT A COMMANDVEHICLE"] call uo_ui_fnc_confirmHint} else {["PLEASE SELECT A SECTOR"] call uo_ui_fnc_confirmHint};

    } else {
        ["mcd_chooseRespawn", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
        (findDisplay 46) displayRemoveEventHandler ["KeyUp", mcd_onRespawnKeyDown];

        [false] call uo_ui_fnc_twoLineHint;
        _pos = if (playerSide == WEST) then {getPos uo_selectedRespawnObject} else {uo_selectedRespawnPos};
        [group player,_pos] remoteExec ["uo_waverespawn_fnc_respawnGroup",2,false];
        [false] call uo_sectors_fnc_drawSectors;
    };
}];
