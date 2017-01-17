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
_dealerPos = selectRandom ([_dealerHouse] call uo_civs_fnc_findBuildingPositions);
_group = createGroup civilian;
uo_DEALER = _group createUnit ["C_man_1",_dealerPos,[],0,"NONE"];

[{!isNull (missionNamespace getVariable ["uo_DEALER", objNull])}, {
    params ["_dealerPos"];

    _unit = uo_DEALER;
    _unit disableAI "PATH";
    _unit setDir (random 360);
    _unit forceAddUniform (selectRandom uo_civUniforms);
    _unit addHeadgear (selectRandom uo_civHeadgear);
    _unit addGoggles (selectRandom uo_civGoggles);

    _unit addItemToUniform "ACE_Cellphone";
    for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_adenosine";};
    _unit addItemToUniform "ACE_atropine";
    for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};

    publicVariable "uo_DEALER";
    _unit addEventHandler ["killed", {
        uo_DEALERKILLED = true;
        publicVariable "uo_DEALERKILLED";
        [missionNamespace getVariable ["bluforcommander",objNull],10000] grad_lbm_fnc_addFunds;
        [[EAST,WEST,CIVILIAN],'Report','The dealer has been killed.'] remoteExec ['uo_common_fnc_sideNotification',0,false];
        [WEST,'Funds received','You received 10000Cr.',{[player] call uo_common_fnc_isCommander}] remoteExec ['uo_common_fnc_sideNotification',0,false];
    }];

    [EAST,"uo_dealerMarker",true,_dealerPos,"mil_marker","COLOREAST"] call uo_common_fnc_createSideMarker;
    [_unit] remoteExec ["uo_missionObjectives_fnc_opforBuyAction",0,true];
}, [_dealerPos]] call CBA_fnc_waitUntilAndExecute;
