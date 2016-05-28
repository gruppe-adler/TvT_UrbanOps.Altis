this = player;

_commander_must_be_selected = {
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
  this forceAddUniform "rhs_uniform_cu_ocp";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_epinephrine";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_EarPlugs";};
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addVest "rhsusf_iotv_ocp_Squadleader";
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
  this addItemToVest "SmokeShellBlue";
  this addItemToVest "SmokeShellGreen";
  this addItemToVest "SmokeShellOrange";
  this addItemToVest "SmokeShellPurple";
  this addItemToVest "SmokeShellRed";
  this addBackpack "tf_rt1523g_big_rhs";
  this addHeadgear "rhsusf_ach_helmet_headset_ocp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m4a1_carryhandle";

  this addPrimaryWeaponItem "rhsusf_acc_compm4";
  this addWeapon "rhsusf_weap_m9";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "ItemGPS";
	this linkItem "tf_anprc152";
};


params ["_role"];
if (!isNil _role) then {call (compile ("call " + _role))} else {diag_log format ["loadouts.sqf - LOADOUT FOR %1 NOT FOUND!", _role]};
