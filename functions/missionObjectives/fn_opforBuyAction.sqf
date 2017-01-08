params ["_dealer"];
private ["_vehicleSpawn"];

if (!hasInterface) exitWith {};
if (isNil "_dealer") exitWith {};
if (isNull _dealer) exitWith {};

_nearestRoad = [getpos _dealer, 50, []] call BIS_fnc_nearestRoad;
if (!isNull _nearestRoad) then {
    _vehicleSpawn = getPos _nearestRoad;
} else {
    _vehicleSpawn = _dealer;
};

_randomPos = (getPos _dealer) vectorAdd [0.5 + random 1,0.5 + random 1,0.2];
_barrel = createVehicle ["Land_BarrelEmpty_F", _randomPos, [], 0, "can_Collide"];
[{!isNull (_this select 0)}, {
    [{
        params ["_barrel","_dealer","_vehicleSpawn","_randomPos"];

        _inventoryPosition = [_randomPos select 0, _randomPos select 1,((getPos _barrel) select 2)];
        deletevehicle _barrel;

        [_dealer,"opf_" + OPFORFACTION,_inventoryPosition,_vehicleSpawn,"THE DEALER","Buy Equipment", {side player == EAST}] call grad_lbm_fnc_addInteraction;
    }, _this, 2] call CBA_fnc_waitAndExecute;

}, [_barrel,_dealer,_vehicleSpawn,_randomPos]] call CBA_fnc_waitUntilAndExecute;
