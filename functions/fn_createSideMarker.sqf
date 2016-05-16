/*  Creates local marker for one side
*
*   Params:
*   0:  side
*   1:  name
*   2:  position
*   3:  type (optional, default: dot)
*   4:  color (optional, default: black)
*   5:  text (optional, default: "")
*   6:  shape (optional, default: icon)
*   7:  size (optional, default: 1)
*   8:  alpha (optional, default: 1)
*   9:  brush (optional,  default: solid)
*/

params [
  "_side",
  "_name",
  "_pos",
  ["_type", "hd_dot"],
  ["_color", "Default"],
  ["_text", ""],
  ["_shape", "ICON"],
  ["_size", 1],
  ["_alpha", 1.0],
  ["_brush", "Solid"]
];

[_side,_name,_pos,_type,_color,_text,_shape,_size,_alpha,_brush] remoteExec ["mcd_fnc_createSideMarkerRemote", 0, false];
