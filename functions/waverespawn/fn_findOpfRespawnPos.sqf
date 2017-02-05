/*    Finds respawn position for Opfor, that is not too close to Blufor units
*
*     Params:
*     None
*
*     Returns:
*     Position (posATL)
*/

#define PREFIX uo
#define COMPONENT missionstart
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_searchPos"];
private ["_nearEnemy","_tooCloseFound"];

_pos = _searchPos;
for [{_i=0}, {_i<50}, {_i=_i+1}] do {
    _tooCloseFound = false;
    {
        _nearEnemy = _x;
        if (_pos distance2D _nearEnemy < 50) exitWith {_tooCloseFound = true};
    } forEach (playableUnits select {side _x == WEST && alive _x});

    if (!_tooCloseFound && !(surfaceIsWater _pos)) exitWith {};

    _pos = _pos getPos [10,(_nearEnemy getDir _pos) + random 30];
};

if (_tooCloseFound) then {_pos = _searchPos};
_pos
