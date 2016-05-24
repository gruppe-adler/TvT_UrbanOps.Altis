/*  Chooses command vehicle based on chosen faction and terrain type
*
*   executed via init.sqf on server
*/

waitUntil {!isNil "ISWOODLAND"};
waitUntil {!isNil "BLUFORFACTION"};

_commandVehicles = [
	["rhsusf_m998_w_s_4dr_fulltop", "rhsusf_m998_d_s_4dr_fulltop"],								//US MARINES
	["Fennek_Flecktarn","Fennek_Tropen"],																					//GERMANY HEER
	["rhs_tigr_msv","rhs_tigr_3camo_msv"],																				//RUSSIA MSV
	["rhsgref_nat_ural","rhsgref_nat_ural"],																			//IND EASTERN REBELS
	["COREV_I_TKG_LandRover","COREV_I_TME_LandRover"]															//IND TERRORISTS
];

_woodLand = call {if (ISWOODLAND) then {0} else {1}};
COMMANDVEHICLECLASS = (_commandVehicles select ("BluforFaction" call BIS_fnc_getParamValue) select _woodLand);

diag_log format ["chooseCommandVehicle.sqf - Command vehicle is %1.", COMMANDVEHICLECLASS];
