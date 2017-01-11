/*    Gets side of killer, adds reputation points
*
*     used in fnc_spawnStaticCivilian
*/

#define PREFIX uo
#define COMPONENT civs
#include "\x\cba\addons\main\script_macros_mission.hpp"

params ["_victim"];
_victim = (_this select 0) select 0;

//get shooter
_shooter = _victim getVariable ["ACE_medical_lastDamageSource",_victim];

//check errors
if (_victim == _shooter) exitWith {INFO_1("%1 killed himself", _victim)};
if (isNull _shooter) exitWith {INFO_1("%1's killer was not found.", _victim)};
if (side _shooter == CIVILIAN) exitWith {INFO_2("%1 was killed by another civilian: %2", _victim, _shooter)};

//add point
if (side _shooter == WEST) then {
    CIVSKILLEDBLU = CIVSKILLEDBLU + 1;
    publicVariable "CIVSKILLEDBLU";
};

if (side _shooter == EAST) then {
    CIVSKILLEDOPF = CIVSKILLEDOPF + 1;
    publicVariable "CIVSKILLEDOPF";
};
