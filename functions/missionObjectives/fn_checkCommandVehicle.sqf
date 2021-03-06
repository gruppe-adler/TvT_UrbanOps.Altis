#define PREFIX uo
#define COMPONENT missionObjectives
#include "\x\cba\addons\main\script_macros_mission.hpp"


if (!isServer) exitWith {};

params ["_cv"];

_h = [{
    (_this select 0) params ["_cv","_inner", "_outer", "_enemyRadius"];
    private ["_cvactive"];

    //cv is destroyed
    if ((isNull _cv || !alive _cv) || {_cv gethitPointDamage "HitEngine" == 1}) exitWith {

        _fundsForKill = 5000;
        _timeForKill = uo_missionParam_DEFENSETIME/6;

        _cv setVariable ["uo_respawnObject_isActive", false, true];
        _cv setVariable ["uo_respawnObject_isDestroyed", true, true];
        missionNamespace setVariable ["uo_cv_allCVs", (missionNamespace getVariable ["uo_cv_allCVs", []]) - [_cv], true];
        if (count (missionNamespace getVariable ["uo_cv_allCVs", []]) == 0) then {[uo_missionstart_defendCVTask,"FAILED",false] call BIS_fnc_taskSetState};

        [missionNamespace getVariable ["opforcommander",objNull],_fundsForKill] call grad_lbm_fnc_addFunds;
        uo_endings_defenseTimeLeft = uo_endings_defenseTimeLeft - _timeForKill;

        [[WEST,CIVILIAN],'Report','A Commandvehicle has been destroyed.',{}] remoteExec ['uo_common_fnc_sideNotification',0,false];
        [EAST,'Commandvehicle destroyed',format ['-%1min defense time',round (_timeForKill/60)],{!([player] call uo_common_fnc_isCommander)}] remoteExec ['uo_common_fnc_sideNotification',0,false];
        [EAST,'Commandvehicle destroyed',format ['+%1 Cr, -%2 min defense time',_fundsForKill,round (_timeForKill/60)],{[player] call uo_common_fnc_isCommander}] remoteExec ['uo_common_fnc_sideNotification',0,false];

        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    //get distance
    _dist = CITYPOSITION distance2D _cv;

    _cvactive = switch (true) do {
        case (_dist < _inner): {false};
        case (_dist > _outer): {false};
        case (speed _cv > 2): {false};
        case ({alive _x && side _x == east} count (nearestObjects [_cv, ["Man"], CVENEMYRADIUS]) > 0): {false};
        default {true}
    };

    _current = _cv getVariable ["uo_respawnObject_isActive", false];
    if ((_cvactive && !_current) || (!_cvactive && _current)) then {
        _cv setVariable ["uo_respawnObject_isActive", _cvactive, true];

        INFO_2("Command vehicle %1 is now %2",_cv,if (_cvactive) then {"active"} else {"inactive"});
    };
} , 2, [_cv, BLUFORSPAWNDIST, BLUFORSPAWNDIST+BLUFORSPAWNBAND, CVENEMYRADIUS]] call CBA_fnc_addPerFrameHandler;

INFO_1("Command vehicle check created for %1. Handle: %2",_cv,_h);
