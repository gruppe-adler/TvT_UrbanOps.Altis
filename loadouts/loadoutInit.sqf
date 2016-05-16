/*	executes loadout scripts
*
*		executed on player via init.sqf
*/

waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {!isNil "originalSide"};
waitUntil {!isNil "BLUFORFACTION"};
waitUntil {!isNil "OPFORFACTION"};
diag_log "loadoutInit.sqf starting...";

private ["_faction"];

if (roleDescription player == "") exitWith {diag_log "loadoutInit.sqf - PLAYER HAS NO ROLE DESCRIPTION!"};

if (originalSide == "WEST") then {
  _faction = BLUFORFACTION;
};
if (originalSide == "EAST") then {
  _faction = OPFORFACTION;
};

_role = [roleDescription player] call mcd_fnc_strToLoadout;
_path = format ["loadouts\loadouts_%1.sqf", _faction];

diag_log format ["loadoutInit.sqf - getting loadout %2 from %1.", _path, _role];
[_role] execVM _path;
