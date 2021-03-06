#define PREFIX uo
#define COMPONENT missionObjectives
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_houseList"];
private ["_dealerHouse","_buildingPos", "_dealerMarkerType"];

//select building
for [{_i=0}, {_i<30}, {_i=_i+1}] do {
    _dealerHouse = selectRandom _houseList;
    if (getpos _dealerHouse distance2D CITYPOSITION < CITYAREASIZE * DEALERRADIUSFACTOR) exitWith {};
};
INFO_1("House selected for dealer: %1",_dealerHouse);

//select position and spawn dealer
_buildingPositions = [_dealerHouse] call uo_common_fnc_findBuildingPositions;
_dealerPos = if (count _buildingPositions > 0) then {selectRandom _buildingPositions} else {[CITYPOSITION,[0,CITYAREASIZE * DEALERRADIUSFACTOR]] call uo_common_fnc_findRandomPos};
_dealerHouse setVariable ["uo_dealerHouse_dealerPos",_dealerPos];

uo_DEALER = (createGroup EAST) createUnit ["C_man_1",_dealerPos,[],0,"NONE"];
uo_DEALER allowDamage false;
_barrel = "Land_BarrelEmpty_F" createVehicleLocal _dealerPos;

//create task
private _taskDescription = "Defend the dealer. You won't lose if he dies, but your side will no longer be able to respawn and the enemy will receive a large sum of money.";
uo_missionstart_defendDealerTask = [EAST,"uo_missionstart_defendDealerTask",[_taskDescription,"Defend Dealer (optional)",""],_dealerPos,"AUTOASSIGNED",3,false,"defend"] call BIS_fnc_taskCreate;

_taskDescription = "Kill the enemy dealer. The dealer is a civilian somewhere in the AO, that can be identified by the drugs in his inventory. There are cable ties in the command vehicle that will help you with this. Once the dealer is dead, the enemy will no longer be able to respawn, and our side will receive a large sum of money.";
uo_missionstart_killDealerTask = [WEST,"uo_missionstart_killDealerTask",[_taskDescription,"Kill Dealer (optional)",""],nil,"AUTOASSIGNED",3,false,"kill"] call BIS_fnc_taskCreate;

//wait until dealer spawned
[{!isNull (_this select 1) && !isNull (_this select 2)}, {
    params ["_dealerPos","_unit","_barrel"];

    _barrel setPosASL ((getPosASL _unit) vectorAdd [random 1, random 1, 0]);

    [_unit] joinSilent (createGroup EAST);    //workaround for weird createUnit bug
    [_unit, false] call grad_aicommand_fnc_setCanReceiveCommands;
    _unit disableAI "PATH";
    _unit setDir (random 360);
    _unit forceAddUniform (selectRandom uo_civs_uniforms);
    if (10 max (2 * count uo_civs_headgear) > random 100) then {_unit addHeadgear (selectRandom uo_civs_headgear)};
    if (10 max (2 * count uo_civs_goggles) > random 100) then {_unit addGoggles (selectRandom uo_civs_goggles)};

    _unit addItemToUniform "ACE_Cellphone";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_adenosine";};
    _unit addItemToUniform "ACE_atropine";
    for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};

    publicVariable "uo_DEALER";
    _unit addEventHandler ["killed", {
        uo_DEALERKILLED = true;
        publicVariable "uo_DEALERKILLED";
        [missionNamespace getVariable ["bluforcommander",objNull],10000] call grad_lbm_fnc_addFunds;
        [[EAST,WEST,CIVILIAN],'Report','The dealer has been killed.'] remoteExec ['uo_common_fnc_sideNotification',0,false];
        [WEST,'Funds received','You received 10000Cr.',{[player] call uo_common_fnc_isCommander}] remoteExec ['uo_common_fnc_sideNotification',0,false];
        [uo_missionstart_defendDealerTask,"FAILED",false] call BIS_fnc_taskSetState;
        [uo_missionstart_killDealerTask,"SUCCEEDED",false] call BIS_fnc_taskSetState;        
    }];

    _nearestRoad = [getpos _unit, 50, []] call BIS_fnc_nearestRoad;
    _vehicleSpawn = if (!isNull _nearestRoad) then {getPos _nearestRoad} else {uo_DEALER};

    /*[EAST,"uo_dealerMarker",true,_dealerPos,"mil_marker","COLOREAST"] call uo_common_fnc_createSideMarker;*/
    [{uo_DEALER allowDamage true}, [], 10] call CBA_fnc_waitAndExecute;

    [{
        params ["_unit","_vehicleSpawn","_barrel"];
        _cargospacePos = (getPosASL _barrel) vectorAdd [0,0,-0.00];
        deleteVehicle _barrel;
        [_unit,_vehicleSpawn,_cargospacePos] remoteExec ["uo_missionObjectives_fnc_opforBuyAction",0,true];
    }, [_unit,_vehicleSpawn,_barrel], 3] call CBA_fnc_waitAndExecute;

}, [_dealerPos,uo_DEALER,_barrel]] call CBA_fnc_waitUntilAndExecute;
