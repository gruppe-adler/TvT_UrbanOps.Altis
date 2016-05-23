/*  Spawns dealer
*
*   executed via server\setup\createCivilians.sqf on server
*
*   Params:
*   0:  position
*/

params ["_pos"];
_group = createGroup civilian;
"C_man_1" createUnit [_pos,_group, "DEALER = this"];

waitUntil {!isNil "DEALER"};
waitUntil {!isNull DEALER};
_unit = DEALER;
_unit disableAI "MOVE";
_unit setDir (random 360);

_unit forceAddUniform (selectRandom civUniforms);
_unit addHeadgear (selectRandom civHeadgear);
_unit addGoggles (selectRandom civGoggles);

_unit addItemToUniform "ACE_Cellphone";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_adenosine";};
_unit addItemToUniform "ACE_atropine";
for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};

publicVariable "DEALER";
DEALER addEventHandler ["killed", {DEALERKILLED = true; publicVariable "DEALERKILLED"}];

diag_log format ["spawnDealer.sqf - Dealer spawned at %1.", _pos];
