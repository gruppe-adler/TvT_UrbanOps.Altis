//exclusion list for houses
_exclusionList = [
	"Land_Pier_F",
	"Land_Pier_small_F",
	"Land_NavigLight",
	"Land_LampHarbour_F",
	"Land_runway_edgelight"
];

//HOUSE LIST ===================================================================
_houseList =    CITYPOSITION nearObjects ["House",CITYAREASIZE+80];
diag_log format ["fn_findHouses - %1 houses found:", (count _houseList)];

//Clean up house list (remove buildings that have no positions)
_cleanUpCounter = 0;
{
	_buildingPos = _x buildingPos 0;
	if ((str _buildingPos) == "[0,0,0]") then {
			_houseList = _houseList - [_x];
			_cleanUpCounter = _cleanUpCounter + 1;
	} else {
        if (typeOf _x in _exclusionList) then {
            _houseList = _houseList - [_x];
            _cleanUpCounter = _cleanUpCounter + 1;
        };
    };
}forEach _houseList;

diag_log format ["fn_findHouses - %1 houses without positions have been cleaned from list. %2 houses remaining.", _cleanUpCounter,(count _houseList)];

_houseList
