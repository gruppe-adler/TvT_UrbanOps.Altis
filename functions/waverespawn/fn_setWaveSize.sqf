/*    Sets wave respawn wave size
*
*/

_bluforWaveSize = "bluforwavesize" call BIS_fnc_getParamValue;
_opforWaveSize = "opforwavesize" call BIS_fnc_getParamValue;

_allPlayers = [] call BIS_fnc_listPlayers;
if (_bluforWaveSize == 0) then {
    _teamSize = west countside _allPlayers;
    BLUFORWAVESIZE = (ceil ((_teamSize / 3) - 0.5)) max 1;
} else {
    BLUFORWAVESIZE = _bluforWaveSize;
};
if (_opforWaveSize == 0) then {
    _teamSize = east countside _allPlayers;
    OPFORWAVESIZE = (ceil ((_teamSize / 3) - 0.5)) max 1;
} else {
    OPFORWAVESIZE = _opforWaveSize;
};

diag_log format ["fn_setWaveSize - Blufor wave size is %1", BLUFORWAVESIZE];
diag_log format ["fn_setWaveSize - Opfor wave size is %1", OPFORWAVESIZE];
