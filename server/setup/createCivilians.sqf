waitUntil {!isNil "CITYPOSITION"};
waitUntil {!isNil "CITYAREASIZE"};

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

//find houses
_houseList =  CITYPOSITION nearObjects ["House",CITYAREASIZE+100];
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
diag_log format ["createCivilians.sqf - %1 houses without positions have been cleaned from list.", _cleanUpCounter];
diag_log format ["createCivilians.sqf - %1 houses remaining.", (count _houseList)];

//spawn static civilians
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
