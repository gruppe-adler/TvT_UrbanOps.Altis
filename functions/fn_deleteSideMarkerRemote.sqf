/*  Deletes local marker for one side, remote executed by mcd_fnc_deleteSideMarker
*
*   Params:
*   0:  side
*   1:  name
*/

if (!hasInterface) exitWith {};

params [
  "_side",
  "_name"
];

if (side player != _side) exitWith {};

if (getMarkerType _name != "") then {
  deleteMarkerLocal _name;
};