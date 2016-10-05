params ["_houseList"];
private ["_dealerHouse","_buildingPos", "_pos"];

//load gear
call compile preprocessFileLineNumbers "loadouts\civilianGear.sqf";

//SPAWN STATIC CIVILIANS =======================================================
_staticCivilianCounter = 0;
_houseCounter = 0;
{
	_bPosCounter = 0;
	_buildingPos = _x buildingpos _bPosCounter;

	//As long as the buildingpos exists, do:
	while {((str _buildingPos) != "[0,0,0]")} do {

		if (CIVILIANPROBABILITY > random 100) then {
			[_buildingPos] call mcd_fnc_spawnStaticCiv;
      _staticCivilianCounter = _staticCivilianCounter +1;
		};

		_bPosCounter = _bPosCounter +1;
		_buildingPos = _x buildingPos _bPosCounter;
	};
} foreach _houseList;
diag_log format ["fn_createCivs - %1 static civilians created.", _staticCivilianCounter];

//SPAWN NON-STATIC CIVILIANS ===================================================
_nonstaticAmount = ceil (CITYAREASIZE * 0.08);
diag_log str _nonstaticAmount;
for [{private _i=0},{_i<_nonstaticAmount},{_i=_i+1}] do {
	diag_log str _i;

	_isWater = true;
	while {_isWater} do {
		_pos = [CITYPOSITION,[0,(CITYAREASIZE * 0.7)], [0,360]] call mcd_fnc_findRandomPos;
		diag_log str _pos;
		_isWater = surfaceIsWater _pos;
		diag_log str _isWater;
	};

	[_pos] call mcd_fnc_spawnNonstaticCiv;
};
diag_log format ["fn_createCivs - %1 non-static civilians created.", _nonstaticAmount];
