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


_tooCloseFound = true;
_isWater = true;
_repetitions = 0;
_pos = [0,0,0];
_spawnradius = CITYAREASIZE * 0.5;
_originalspawnradius = _spawnradius;

while {_tooCloseFound || _isWater} do {
    _tooCloseFound = false;
    _isWater = true;

    //check water
    while {_isWater} do {
        _pos = [CITYPOSITION,[0,_spawnradius], [0,360]] call uo_common_fnc_findRandomPos;
        _isWater = surfaceIsWater _pos;
    };

    //check distance to blufor
    {
        if (side _x != east) then {
            if (_pos distance2D _x < OPFORRESPAWNDIST) exitWith {_tooCloseFound = true};
        };
        if (_tooCloseFound) exitWith {};
    } forEach playableUnits;

    if (_repetitions > 20) then {
        _tooCloseFound = false;
    };

    //increase search radius
    _spawnradius = _spawnradius + 0.15 * _originalspawnradius;
    _repetitions = _repetitions + 1;
};

if (_repetitions > 20) then {
    INFO("Cannot find OPFOR respawn position with sufficient distance to all BLUFOR players. Using random position instead.");
} else {
    INFO_1("Respawnposition for OPFOR found. %1 repetitions for sufficient distance to all BLUFOR players.",_repetitions);
};


//return
_pos
