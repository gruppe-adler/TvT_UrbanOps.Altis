/*  Chooses command vehicle based on chosen faction and terrain type
*
*   executed via init.sqf on server
*/

waitUntil {!isNil "ISWOODLAND"};
waitUntil {!isNil "BLUFORFACTION"};

_factions = getArray (missionConfigFile >> "Params" >> "BluforFaction" >> "values");
_commandVehicles = [
	["rhsusf_m998_w_s_4dr_fulltop", "rhsusf_m998_d_s_4dr_fulltop"],			//US MARINES
	["Fennek_Flecktarn","Fennek_Tropen"],																//GERMANY HEER
	["rhs_tigr_msv","rhs_tigr_3camo_msv"]																//RUSSIA MSV
];

_woodLand = call {if (ISWOODLAND) then {0} else {1}};
COMMANDVEHICLECLASS = (_commandVehicles select (_factions find BLUFORFACTION) select _woodLand);

diag_log format ["chooseCommandVehicle.sqf - Command vehicle is %1.", COMMANDVEHICLECLASS];
