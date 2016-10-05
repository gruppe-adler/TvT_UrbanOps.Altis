/*  Creates local marker for one side
*
*   Params:
*   0:  side
*   1:  name
*   2:  delete old marker if name already in use
*   3:  position
*   4:  type (optional, default: dot)
*   5:  color (optional, default: black)
*   6:  text (optional, default: "")
*   7:  shape (optional, default: icon)
*   8:  size (optional, default: 1)
*   9:  alpha (optional, default: 1)
*  10:  brush (optional,  default: solid)
*/

params [
  "_side",
  "_name",
  "_overwrite",
  "_pos",
  ["_type", "hd_dot"],
  ["_color", "Default"],
  ["_text", ""],
  ["_shape", "ICON"],
  ["_size", 1],
  ["_alpha", 1.0],
  ["_brush", "Solid"]
];

[_side,_name,_overwrite,_pos,_type,_color,_text,_shape,_size,_alpha,_brush] remoteExec ["mcd_fnc_createSideMarkerRemote", 0, false];
