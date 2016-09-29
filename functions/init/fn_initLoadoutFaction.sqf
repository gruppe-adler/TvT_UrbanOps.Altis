private ["_loadoutFaction"];

if (!hasInterface) exitWith {};

_originalSide = [] call mcd_fnc_originalSide;

if (_originalSide == "WEST") then {
  _loadoutFaction = BLUFORFACTION;
} else {
  _loadoutFaction = OPFORFACTION;
};

if (!ISWOODLAND) then {
  _loadoutFaction = _loadoutFaction + "_des";
};

GRAD_Loadout_Chosen_Prefix = _loadoutFaction;
