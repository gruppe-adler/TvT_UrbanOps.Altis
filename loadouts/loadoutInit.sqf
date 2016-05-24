/*	executes loadout scripts
*
*		executed on player via init.sqf
*/

waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {!isNil "originalSide"};
waitUntil {!isNil "BLUFORFACTION"};
waitUntil {!isNil "OPFORFACTION"};
waitUntil {!isNil "ISWOODLAND"};

diag_log "loadoutInit.sqf starting...";

private ["_faction","_type"];

if (roleDescription player == "") exitWith {diag_log "loadoutInit.sqf - PLAYER HAS NO ROLE DESCRIPTION!"};

if (originalSide == "WEST") then {
  _faction = BLUFORFACTION;
};
if (originalSide == "EAST") then {
  _faction = OPFORFACTION;
};

if (ISWOODLAND) then {
  _type = "woodland";
} else {
  _type = "desert";
};

_role = [roleDescription player] call mcd_fnc_strToLoadout;
_path = format ["loadouts\loadouts_%1_%2.sqf", _faction, _type];
if !([_path] call KK_fnc_fileExists) then {
  _path = format ["loadouts\loadouts_%1.sqf", _faction];
};

diag_log format ["loadoutInit.sqf - getting loadout %2 from %1.", _path, _role];
[_role] execVM _path;
