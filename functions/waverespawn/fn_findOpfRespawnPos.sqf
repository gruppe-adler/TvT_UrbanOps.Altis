/*    Finds respawn position for Opfor, that is not too close to Blufor units
*
*     Params:
*     None
*
*     Returns:
*     Position (posATL)
*/

#define PREFIX uo
#define COMPONENT waverespawn
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_searchPos"];
private ["_nearEnemy","_tooCloseFound","_checkPos","_sectorID","_enemySector","_availablePos"];

if (uo_missionParam_PRESET == "DEBUG") then {
    for [{_k=0}, {_k<3}, {_k=_k+1}] do {
        for [{_j=0}, {_j<50}, {_j=_j+1}] do {
            deleteMarker format ["opfrespawn_debug_%1_%2",_k,_j];
        };
    };
};


//spawn inside city
if (uo_missionParam_OPFORRESPAWNMODE == 1) then {
    for [{_h=0}, {_h<3}, {_h=_h+1}] do {
        _checkPos = _searchPos;
        _lastPos = _searchPos;
        _lastDir = CITYPOSITION getDir _searchPos;

        for [{_i=0}, {_i<50}, {_i=_i+1}] do {

            if (uo_missionParam_PRESET == "DEBUG") then {
                _m = createMarkerLocal [format ["opfrespawn_debug_%1_%2",_h,_i],_checkPos];
                _m setMarkerType "hd_dot";
                _m setMarkerColor "COLOREAST";
                _m setMarkerText format ["%1-%2",_h,_i];
            };

            _tooCloseFound = false;
            _nearEnemy = objNull;
            {
                _nearEnemy = _x;
                if (_checkPos distance2D _nearEnemy < 70) exitWith {_tooCloseFound = true};
            } forEach (allUnits select {side _x == WEST && alive _x});

            _sectorID = [_checkPos] call uo_sectors_fnc_getSector;
            _enemySector = !(_sectorID == -1) && !([_sectorID] call uo_sectors_fnc_checkSector);
            if (!_tooCloseFound && !(surfaceIsWater _checkPos) && !_enemySector) exitWith {};

            _turn = if ((CITYPOSITION getDir _lastPos) < (CITYPOSITION getDir _checkPos)) then {1} else {-1};
            _lastPos = _checkPos;
            _lastDir = (_lastDir/5) + ((_nearEnemy getDir _checkPos)) + ((random 20)*_turn);
            _checkPos = _checkPos getPos [10,_lastDir];
        };

        if (!_tooCloseFound && !(surfaceIsWater _checkPos) && !_enemySector) exitWith {};
    };

    if (_tooCloseFound) then {_checkPos = _searchPos};


//spawn outside city
} else {
    _searchDist = BLUFORSPAWNDIST + BLUFORSPAWNBAND + 400;
    _westUnits = playableUnits select {side _x == WEST && (getPos _x) distance2D _searchPos > 250};
    _dirArray = _westUnits apply {_searchPos getDir _x};
    _dirArray sort true;

    _selectedDir = random 360;
    if (count _dirArray == 0) then {
        _availablePos = _searchPos getPos [_searchDist,_selectedDir]
    } else {
        _dirArray pushBack ((_dirArray select 0) + 360);
        _maxDelta = 0;
        for [{_i=0},{_i<(count _dirArray)-1},{_i=_i+1}] do {
            _delta = (_dirArray select (_i+1)) - (_dirArray select _i);
            if (_delta > _maxDelta) then {
                _maxDelta = _delta;
                _selectedDir = (_dirArray select _i) + _delta/2;
            };
        };

        if (_selectedDir > 360) then {_selectedDir = _selectedDir - 360};
        _availablePos = _searchPos getPos [_searchDist,_selectedDir];
    };

    for [{_i=0},{_i<500},{_i=_i+1}] do {
        _checkPos = _availablePos getPos [5*_i,random 360];
        if !(surfaceIsWater _checkPos) exitWith {};
    };
    if (surfaceIsWater _checkPos) then {
        _checkPos = _availablePos;
        ERROR_1("No land position found around %1.",_availablePos);
    };

    if (uo_missionParam_PRESET == "DEBUG") then {
        _m = createMarkerLocal ["opfrespawn_debug_0_0",_checkPos];
        _m setMarkerType "hd_dot";
        _m setMarkerColor "COLOREAST";
        _m setMarkerText "SEARCHPOS CENTER";
    };
};


_checkPos
