#define PREFIX uo
#define COMPONENT common
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_searchPos","_radius"];

//exclusion list for houses
_exclusionList = [
	"Land_Pier_F",
	"Land_Pier_small_F",
	"Land_NavigLight",
	"Land_LampHarbour_F",
	"Land_runway_edgelight"
];

//HOUSE LIST ===================================================================
_houseList = nearestObjects [_searchPos,["House"],_radius];

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

_houseList
