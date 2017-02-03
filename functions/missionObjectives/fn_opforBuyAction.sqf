params ["_dealer","_vehicleSpawn","_cargospacePos"];

if (!hasInterface) exitWith {};
if (isNil "_dealer") exitWith {};
if (isNull _dealer) exitWith {};

[{!isNull (_this select 0)}, {
    [{
        params ["_dealer","_vehicleSpawn","_cargospacePos"];

        [_dealer,"opf_" + uo_missionParam_OPFORFACTION,_cargospacePos,_vehicleSpawn,"THE DEALER","Buy Equipment", {side (_this select 1) == EAST && alive (_this select 0)}] call grad_lbm_fnc_addInteraction;
    }, _this, 2] call CBA_fnc_waitAndExecute;

}, [_dealer,_vehicleSpawn,_cargospacePos]] call CBA_fnc_waitUntilAndExecute;
