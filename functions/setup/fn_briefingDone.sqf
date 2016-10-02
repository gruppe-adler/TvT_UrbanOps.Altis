/*  Tells server that pre-game briefing is done
*
*/

if (!hasInterface) exitWith {};

[{getClientState == "BRIEFING READ"}, {
  if (!(missionNamespace getVariable ["uo_init_briefingDone", false])) then {
    diag_log "fn_briefingDone - First to complete briefing. Setting variable.";
    missionNamespace setVariable ["uo_init_briefingDone", true, true];
  };
}, []] call CBA_fnc_waitUntilAndExecute;
