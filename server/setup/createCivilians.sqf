/*	Spawns civilians and find position for dealer
*
*		executed via init.sqf on server
*/

waitUntil {!isNil "CITYPOSITION"};
waitUntil {!isNil "CITYAREASIZE"};

private ["_dealerHouse","_buildingPos"];

//load gear
call compile preprocessFileLineNumbers "loadouts\civilianGear.sqf";

//exclusion list for houses
_exclusionList = [
	"Land_Pier_F",
	"Land_Pier_small_F",
	"Land_NavigLight",
	"Land_LampHarbour_F",
	"Land_runway_edgelight"
];

//HOUSE LIST ===================================================================
_houseList =  CITYPOSITION nearObjects ["House",CITYAREASIZE+80];
diag_log format ["createCivilians.sqf - %1 houses found:", (count _houseList)];

//Clean up house list (remove buildings that have no positions)
_cleanUpCounter = 0;
{
	_buildingPos = _x buildingPos 0;
	if ((str _buildingPos) == "[0,0,0]") then {
			_houseList = _houseList - [_x];
			_cleanUpCounter = _cleanUpCounter + 1;
	};
}forEach _houseList;
diag_log format ["createCivilians.sqf - %1 houses without positions have been cleaned from list. %2 houses remaining.", _cleanUpCounter,(count _houseList)];


//SPAWN STATIC CIVILIANS =======================================================
staticCivilians = [];
_staticCivilianTotalCounter = 0;
_houseCounter = 0;
_halfNumberOfHouses = (count _houseList) / 2;
{
	_bPosCounter = 0;
	_staticCivilianCounter = 0;
	_civilianSpawned = false;

	_type = typeOf _x;

	if (!(_type in _exclusionList)) then {

		//buildingpos ID 0
		_buildingPos = _x buildingpos _bPosCounter;

		//As long as the buildingpos exists, do:
		while {((str _buildingPos) != "[0,0,0]")} do {

			if (CIVILIANPROBABILITY > random 100) then {
				_hndl = [_buildingPos] spawn mcd_fnc_spawnStaticCivilian;
        waitUntil {scriptDone _hndl};
        _staticCivilianCounter = _staticCivilianCounter +1;
				_civilianSpawned = true;
			};

			//Next buildingpos
			_bPosCounter = _bPosCounter +1;
			_buildingPos = _x buildingPos _bPosCounter;
		};
	};

	_staticCivilianTotalCounter = _staticCivilianTotalCounter + _staticCivilianCounter;
}foreach _houseList;
diag_log format ["createCivilians.sqf - %1 static civilians created.", _staticCivilianTotalCounter];


//SPAWN DEALER =================================================================
//select building
_isExcluded = true;
while {_isExcluded} do {
	_dealerHouse = selectRandom _houseList;
	if !(typeOf _dealerHouse in _exclusionList) then {
		_isExcluded = false;
	};
	if (str (_dealerHouse buildingpos 0) == "[0,0,0]") then {
		_isExcluded = true;
	};
	if (getpos _dealerHouse distance2D CITYPOSITION > CITYAREASIZE*DEALERRADIUSFACTOR) then {
		_isExcluded = true;
	};
};
diag_log format ["createCivilians.sqf - House selected for dealer: %1.",_dealerHouse];

//find positions
_allPositions = [];
_allfound = false;
_bPosCounter = 0;
while {!_allFound} do {
	_bPos = _dealerHouse buildingpos _bPosCounter;
	if (str _bPos != "[0,0,0]") then {
		_allPositions pushBack _bPos;
		_bPosCounter = _bPosCounter + 1;
	} else {
		_allFound = true;
	};
};
diag_log format ["createCivilians.sqf - Positions found in dealer house: %1.",_bPosCounter];

//select position and spawn dealer
_dealerPos = selectRandom _allPositions;
[_dealerPos] execVM "server\setup\spawnDealer.sqf";


//SPAWN NON-STATIC CIVILIANS ===================================================
_nonstaticAmount = ceil (CITYAREASIZE * 0.08);
diag_log format ["createCivilians.sqf - Creating %1 non-static civilians.", _nonstaticAmount];
for [{_i=0},{_i<_nonstaticAmount},{_i=_i+1}] do {
	_pos = [0,0,0];
	_isWater = true;
	while {_isWater} do {
		_pos = [CITYPOSITION,[0,(CITYAREASIZE * 0.7)], [0,360]] call SHK_pos;
		_isWater = surfaceIsWater _pos;
	};

	_hndl = [_pos] spawn mcd_fnc_spawnNonstaticCivilian;
	waitUntil {scriptDone _hndl};
};
