#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

//BLUFOR =======================================================================
[{
    ["WAVERESPAWNSTATUSBLU",[WEST] call uo_waverespawn_fnc_getStatus] call CBA_fnc_publicVariable;

    //dont execute while respawning is possible
    if (WAVERESPAWNBLU) exitWith {};

    //start countdown once first player is added to wave
    if (count deadPlayersBlu > 0) then {
        WAVERESPAWNTIMELEFTBLU = (WAVERESPAWNTIMELEFTBLU - 1) max 0;
        publicVariable "WAVERESPAWNTIMELEFTBLU";
    } else {
        ["WAVERESPAWNTIMELEFTBLU",uo_missionParam_WAVERESPAWNTIMEBLU] call CBA_fnc_publicVariable;
    };

    //enable respawning when wave is full
    if (["WEST"] call uo_waverespawn_fnc_canRespawn) then {
        _newGroups = [WEST] call uo_waverespawn_fnc_organizeInGroup;
        {
            [_x] remoteExec ["uo_waverespawn_fnc_chooseRespawn",0,false];
            [{_this call uo_waverespawn_fnc_autoChooseRespawn}, _x, AUTOCHOOSETIMEOUT] call CBA_fnc_waitAndExecute;
        } forEach _newGroups;

        WAVERESPAWNBLU = true;
        publicVariable "WAVERESPAWNBLU";
        INFO("Respawning now possible for Blufor.");

        [{
            _newGroups = [WEST] call uo_waverespawn_fnc_organizeInGroup;
            {
                [_x] remoteExec ["uo_waverespawn_fnc_chooseRespawn",0,false];
                [{_this call uo_waverespawn_fnc_autoChooseRespawn}, _x, AUTOCHOOSETIMEOUT] call CBA_fnc_waitAndExecute;
            } forEach _newGroups;

            WAVERESPAWNBLU = false;
            publicVariable "WAVERESPAWNBLU";
            WAVERESPAWNTIMELEFTBLU = uo_missionParam_WAVERESPAWNTIMEBLU;
            publicVariable    "WAVERESPAWNTIMELEFTBLU";
            INFO("Respawning no longer possible for Blufor.");
        },[],(RESPAWNWAVEEXTRATIME max 7)] call CBA_fnc_waitAndExecute;
    };
}, 1, []] call CBA_fnc_addPerFrameHandler;

//OPFOR ========================================================================
[{
    ["WAVERESPAWNSTATUSOPF",[EAST] call uo_waverespawn_fnc_getStatus] call CBA_fnc_publicVariable;
    if (uo_DEALERKILLED) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler; WAVERESPAWNOPF = false; publicVariable "WAVERESPAWNOPF"};

    //dont execute while respawning is possible
    if (WAVERESPAWNOPF) exitWith {};

    //start countdown once first player is added to wave
    if (count deadPlayersOpf > 0) then {
        WAVERESPAWNTIMELEFTOPF = (WAVERESPAWNTIMELEFTOPF - 1) max 0;
        publicVariable "WAVERESPAWNTIMELEFTOPF";
    } else {
        ["WAVERESPAWNTIMELEFTOPF",uo_missionParam_WAVERESPAWNTIMEOPF] call CBA_fnc_publicVariable;
    };

    //enable respawning when wave is full
    if (["EAST"] call uo_waverespawn_fnc_canRespawn) then {
        _newGroups = [EAST] call uo_waverespawn_fnc_organizeInGroup;
        {
            [_x] remoteExec ["uo_waverespawn_fnc_chooseRespawn",0,false];
            [{_this call uo_waverespawn_fnc_autoChooseRespawn}, _x, AUTOCHOOSETIMEOUT] call CBA_fnc_waitAndExecute;
        } forEach _newGroups;

        WAVERESPAWNOPF = true;
        publicVariable "WAVERESPAWNOPF";
        INFO("Respawning now possible for Opfor.");

        if (uo_missionParam_OPFORRESPAWNMODE == 2) then {
            ["uo_notification",["OPFOR RESPAWN","Opfor reinforcements are on the way."]] remoteExec ["bis_fnc_showNotification",0,false];
        };

        [{
            _newGroups = [EAST] call uo_waverespawn_fnc_organizeInGroup;
            {
                [_x] remoteExec ["uo_waverespawn_fnc_chooseRespawn",0,false];
                if (uo_missionParam_OPFORRESPAWNMODE == 1) then {
                    [{_this call uo_waverespawn_fnc_autoChooseRespawn}, _x, AUTOCHOOSETIMEOUT] call CBA_fnc_waitAndExecute;
                };
            } forEach _newGroups;

            WAVERESPAWNOPF = false;
            publicVariable "WAVERESPAWNOPF";
            WAVERESPAWNTIMELEFTOPF = uo_missionParam_WAVERESPAWNTIMEOPF;
            publicVariable    "WAVERESPAWNTIMELEFTOPF";
            INFO("Respawning no longer possible for Opfor.");
            missionNamespace setVariable ["uo_opf_safeRespawnPos",nil,true];
        },[],(RESPAWNWAVEEXTRATIME max 7)] call CBA_fnc_waitAndExecute;
    };
}, 1, []] call CBA_fnc_addPerFrameHandler;
