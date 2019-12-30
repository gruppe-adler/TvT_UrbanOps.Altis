params ["_cv"];

_cv setDir (_cv getDir CITYPOSITION);
_cv setVariable ["uo_respawnObject_isActive", false, true];

_allCVs = missionNamespace getVariable ["uo_cv_allCVs", []];
_id = _allCVs pushBack _cv;
missionNamespace setVariable ["uo_cv_allCVs", _allCVs, true];

[_cv] call uo_common_fnc_emptyContainer;
_cv addItemCargoGlobal ["ACE_CableTie", 50];
[_cv] call uo_missionObjectives_fnc_checkCommandVehicle;
[_cv] remoteExec ["uo_missionObjectives_fnc_bluforBuyAction",0,true];
[_cv] remoteExec ["uo_missionObjectives_fnc_cvDestroyAction",0,true];
[_cv] remoteExec ["uo_missionObjectives_fnc_onCvCreate",0,true];
[_cv, _id+1] remoteExec ["uo_missionObjectives_fnc_commandVehicleMarker",0,true];
