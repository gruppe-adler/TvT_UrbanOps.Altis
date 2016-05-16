this = player;

_commander = {
  comment "Exported from Arsenal by McDiod";

  comment "Remove existing items";
  removeAllWeapons this;
  removeAllItems this;
  removeAllAssignedItems this;
  removeUniform this;
  removeVest this;
  removeBackpack this;
  removeHeadgear this;
  removeGoggles this;

  comment "Add containers";
  this forceAddUniform "U_CombatUniShirtMercA_E";
  this addItemToUniform "FirstAidKit";
  for "_i" from 1 to 3 do {this addItemToUniform "10Rnd_762x54_Mag";};
  this addItemToUniform "16Rnd_9x21_Mag";
  this addVest "ARC_Common_Cbr_Plate_Carrier";
  this addItemToVest "SmokeShell";
  this addItemToVest "SmokeShellGreen";
  for "_i" from 1 to 2 do {this addItemToVest "Chemlight_green";};
  for "_i" from 1 to 2 do {this addItemToVest "HandGrenade";};
  for "_i" from 1 to 2 do {this addItemToVest "16Rnd_9x21_Mag";};
  this addBackpack "RHS_NSV_Tripod_Bag";
  this addHeadgear "rhs_6b26_green";
  this addGoggles "NeckTight_ODBLK";

  comment "Add weapons";
  this addWeapon "srifle_DMR_01_F";
  this addPrimaryWeaponItem "acc_pointer_IR";
  this addPrimaryWeaponItem "optic_Aco";
  this addWeapon "rhs_weap_smaw_green";
  this addSecondaryWeaponItem "ACE_acc_pointer_green_IR";
  this addSecondaryWeaponItem "rhs_weap_optic_smaw_3";
  this addWeapon "Pstl9x19_NP42";
  this addWeapon "ACE_MX2A";

  comment "Add items";
  this linkItem "tf_microdagr";
  this linkItem "tf_rf7800str";
  this linkItem "O_UavTerminal";
};


params ["_role"];
if (!isNil _role) then {call (compile ("call " + _role))} else {diag_log format ["loadouts.sqf - LOADOUT FOR %1 NOT FOUND!", _role]};
