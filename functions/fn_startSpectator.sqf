/*  Starts spectator mode
*
*   executed via onPlayerKilled.sqf while player is waiting for respawn
*/
private ["_cause"];

setPlayerRespawnTime 99999;

if (originalSide == "WEST") then {
  _cause = parseText format ["<t align='center' size='1.4'>Commandvehicle destroyed.</t>"];
};
if (originalSide == "EAST") then {
  _cause = parseText format ["<t align='center' size='1.4'>Dealer killed.</t>"];
};

//show hint - respawn no longer possible
_rule = parseText "<t align='center'><t color='#708090'>-----------------------------------------------------<br /></t></t>";
_lineBreak = parseText "<br />";
_respawnIn = parseText format ["<t align='center' size='1.4'>Respawn <t color='#cc0000'>not available.</t></t>"];
hint composeText [_rule,_cause,_lineBreak,_respawnIn,_lineBreak,_rule];

//start spectator
["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;

sleep 5;
hint "";
