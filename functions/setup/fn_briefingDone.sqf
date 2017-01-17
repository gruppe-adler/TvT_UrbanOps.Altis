/*    Tells server that pre-game briefing is done
*
*/

if (!hasInterface) exitWith {};

[{getClientState == "BRIEFING READ"}, {
    if (!(missionNamespace getVariable ["uo_init_briefingDone", false])) then {
        ["%1 was first to complete briefing.", name player] call uo_common_fnc_serverLog;
        missionNamespace setVariable ["uo_init_briefingDone", true, true];
    };
}, []] call CBA_fnc_waitUntilAndExecute;
