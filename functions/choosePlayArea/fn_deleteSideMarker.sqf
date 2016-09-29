/*  Deletes local marker for one side
*
*   Params:
*   0:  side
*   1:  name
*/

params [
  "_side",
  "_name"
];

[_side,_name] remoteExec ["mcd_fnc_deleteSideMarkerRemote", 0, false];
