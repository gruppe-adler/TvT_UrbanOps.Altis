/*    Finds respawn position for Opfor, that is not too close to Blufor units
*
*     Params:
*     None
*
*     Returns:
*     Position (posATL)
*/

#include "script_component.hpp"

params ["_searchPos"];
private ["_nearEnemy","_tooCloseFound","_checkPos","_sectorID","_enemySector","_availablePos"];


if (uo_missionParam_PRESET == "DEBUG") then {
    for [{_k=0}, {_k<3}, {_k=_k+1}] do {
        for [{_j=0}, {_j<50}, {_j=_j+1}] do {
            deleteMarker format ["opfrespawn_debug_%1_%2",_k,_j];
        };
    };
};


// SPAWN INSIDE CITY ===========================================================
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

            _sectorID = [_checkPos] call EFUNC(sectors,getSector);
            _enemySector = !(_sectorID == -1) && !([_sectorID] call EFUNC(sectors,checkSector));
            if (!_tooCloseFound && !(surfaceIsWater _checkPos) && !_enemySector) exitWith {};

            _turn = if ((CITYPOSITION getDir _lastPos) < (CITYPOSITION getDir _checkPos)) then {1} else {-1};
            _lastPos = _checkPos;
            _lastDir = (_lastDir/5) + ((_nearEnemy getDir _checkPos)) + ((random 20)*_turn);
            _checkPos = _checkPos getPos [10,_lastDir];
        };

        if (!_tooCloseFound && !(surfaceIsWater _checkPos) && !_enemySector) exitWith {};
    };

    if (_tooCloseFound) then {_checkPos = _searchPos};



// SPAWN OUTSIDE CITY ==========================================================
} else {
    _searchDist = BLUFORSPAWNDIST + BLUFORSPAWNBAND + 400;
    _westUnits = allUnits select {side _x == WEST && {(getPos _x) distance2D _searchPos > 250}};
    _dirArray = _westUnits apply {_searchPos getDir _x};
    _dirArray sort true;
    _bestDirRanking = [];
    _selectedDir = random 360;


    // there are not enough relevant enemy units around --> spawnpos can be anywhere
    if (count _dirArray <= 1) then {

        for [{_i=0},{_i<100},{_i=_i+1}] do {
            _availablePos = _searchPos getPos [_searchDist,random 360];

            for [{_j=0},{_j<10},{_j=_j+1}] do {
                _checkPos = _availablePos getPos [5*_i,random 360];
                if !(surfaceIsWater _checkPos) exitWith {};
            };
            if !(surfaceIsWater _checkPos) exitWith {};
        };


    // find direction in which there are the least enemy units
    } else {
        _dirArray pushBack ((_dirArray select 0) + 360);
        for [{_i=0},{_i<(count _dirArray)-1},{_i=_i+1}] do {
            _delta = (_dirArray select (_i+1)) - (_dirArray select _i);
            _bestDirRanking pushBack [_delta,(_dirArray select _i) + _delta/2];
        };
        _bestDirRanking sort false;

        // _bestDirRankingFilled expands _bestDirRanking by intermittent directions, that are also viable
        _bestDirRankingFilled = [];
        {
            _x params ["_delta","_dir"];

            _maxIndex = (count _bestDirRanking) - 1;
            _previousIndex = [_forEachIndex - 1,_maxIndex] select (_forEachIndex == 0);
            _nextIndex = [_forEachIndex + 1,0] select (_forEachIndex == _maxIndex);

            (_bestDirRanking select _previousIndex) params ["_previousDelta","_previousDir"];
            (_bestDirRanking select _nextIndex) params ["_nextDelta","_nextDir"];

            _bestDirRankingFilled pushBack [_delta,_dir];

            _increment = 5;
            _noFurtherIncrement = false;
            while {!_noFurtherIncrement} do {

                _fillDelta = _delta/2 - _increment;

                _nextFillDir = _dir + _increment;
                if (_nextFillDir > 360) then {_nextFillDir = _nextFillDir - 360};

                _previousFillDir = _dir - _increment;
                if (_previousFillDir < 0) then {_previousFillDir = _previousFillDir + 360};

                _noFurtherIncrement = true;
                if (_nextFillDir < _nextDir && {_fillDelta > (_nextDelta/2)}) then {
                    _bestDirRankingFilled pushBack [_fillDelta,_nextFillDir];
                    _noFurtherIncrement = false;
                };
                if (_previousFillDir > _previousDir && {_fillDelta > (_previousDelta/2)}) then {
                    _bestDirRankingFilled pushBack [_fillDelta,_previousFillDir];
                    _noFurtherIncrement = false;
                };

                _increment = _increment + 5;
            };

        } forEach _bestDirRanking;
        _bestDirRankingFilled sort false;

        // look in _bestDirRankingFilled for positions that or not on water
        {
            _availablePos = _searchPos getPos [_searchDist,_x select 1];

            for [{_i=0},{_i<10},{_i=_i+1}] do {
                _checkPos = _availablePos getPos [5*_i,random 360];
                if !(surfaceIsWater _checkPos) exitWith {};
            };

            if !(surfaceIsWater _checkPos) exitWith {diag_log format ["Using _bestDirRankingFilled Nr. %1",_forEachIndex]};
        } forEach _bestDirRankingFilled;

        if (_selectedDir > 360) then {_selectedDir = _selectedDir - 360};
    };


    if (surfaceIsWater _checkPos) then {
        _checkPos = _searchPos;
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
