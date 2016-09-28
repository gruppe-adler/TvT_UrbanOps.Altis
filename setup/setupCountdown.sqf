/*  Provides synced countdown time value for players
*
*   executed via init.sqf on server
*/

SETUPTIMEREMAINING = SETUPTIME;
publicVariable "SETUPTIMEREMAINING";
waitUntil {sleep 0.5; !isNil "CITYPOSITION"};

["LOG", "SERVER SETUP", "setupCountdown.sqf starting..."] call mcd_fnc_diagReport;

_countdown = {
  SETUPTIMEREMAINING = SETUPTIMEREMAINING - 1;
  publicVariable "SETUPTIMEREMAINING";
  if (SETUPTIMEREMAINING <= 0) then {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
  };
};
[_countdown, 1, []] call CBA_fnc_addPerFrameHandler;
