/*  Checks if file exists
*
*   By KillzoneKid
*/

private ["_ctrl", "_fileExists"];
disableSerialization;
_ctrl = findDisplay 0 ctrlCreate ["RscHTML", -1];
_ctrl htmlLoad (_this select 0);
_fileExists = ctrlHTMLLoaded _ctrl;
ctrlDelete _ctrl;
_fileExists
