/* teleports blufor players to their spawn position
*
* executed remotely by server on clients
*/

if (!hasInterface) exitWith {};
if (side player != WEST) exitWith {};

private ["_pos"];

while {isNil "_pos"} do {
	_pos = player getVariable "spawnPosition";
	sleep 0.5;
};

diag_log format ["Teleporting player to %1.", _pos];
player allowDamage false;
player setPos _pos;
sleep 2;
player allowDamage true;

openMap [false, false];
