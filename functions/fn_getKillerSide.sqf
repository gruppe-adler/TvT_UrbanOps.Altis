/*  Gets side of killer, adds reputation points
*
*   used in fnc_spawnStaticCivilian
*/

_victim = (_this select 0) select 0;

//get shooter
_shooter = _victim getVariable ["ACE_medical_lastDamageSource",_victim];

//check errors
if (_victim == _shooter) exitWith {diag_log format ["fnc_getKillerSide - %1 killed himself.", _victim]};
if (isNull _shooter) exitWith {diag_log format ["fnc_getKillerSide - %1's killer was not found.", _victim]};
if (side _shooter == CIVILIAN) exitWith {diag_log format ["fnc_getKillerSide - %1 was killed by another civilian: %2", _victim, _shooter]};

//add point
if (side _shooter == WEST) then {
  CIVSKILLEDBLU = CIVSKILLEDBLU + 1;
  publicVariable "CIVSKILLEDBLU";
};

if (side _shooter == EAST) then {
  CIVSKILLEDOPF = CIVSKILLEDOPF + 1;
  publicVariable "CIVSKILLEDOPF";
};
