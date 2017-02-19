#define PREFIX uo
#define COMPONENT civs
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_houseList"];
private ["_dealerHouse","_buildingPos", "_pos"];


//SPAWN STATIC CIVILIANS =======================================================
_staticCivilianCounter = 0;
_houseCounter = 0;
{
	_bPosCounter = 0;
	_buildingPos = _x buildingpos _bPosCounter;

	//As long as the buildingpos exists, do:
	while {((str _buildingPos) != "[0,0,0]")} do {

		if (CIVILIANPROBABILITY > random 100 && !(typeOf _x in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F","Land_i_Garage_V1_dam_F"])) then {
			if (count (_x getVariable ["uo_dealerHouse_dealerPos",[]]) > 0 && {_x getVariable ["uo_dealerHouse_dealerPos",[]] isEqualTo _buildingPos}) exitWith {};
			[_buildingPos,true] call uo_civs_fnc_spawnCiv;
            _staticCivilianCounter = _staticCivilianCounter +1;
		};

		_bPosCounter = _bPosCounter +1;
		_buildingPos = _x buildingPos _bPosCounter;
	};
} foreach _houseList;
INFO_1("%1 static civilians created.", _staticCivilianCounter);

//SPAWN NON-STATIC CIVILIANS ===================================================
_nonstaticAmount = ceil (CITYAREASIZE * 0.05);

/*for _i from 1 to _nonstaticAmount do {*/
for [{private _i=0},{_i<_nonstaticAmount},{_i=_i+1}] do {
	_isWater = true;
	while {_isWater} do {
		_pos = [CITYPOSITION,[0,(CITYAREASIZE * 0.7)], [0,360]] call uo_common_fnc_findRandomPos;
		_isWater = surfaceIsWater _pos;
	};

	[_pos] call uo_civs_fnc_spawnCiv;
};
INFO_1("%1 non-static civilians created.", _nonstaticAmount);
