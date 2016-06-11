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
  this forceAddUniform "rhs_uniform_cu_ucp";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_epinephrine";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_EarPlugs";};
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addVest "rhsusf_iotv_ucp_Squadleader";
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
  this addItemToVest "SmokeShellBlue";
  this addItemToVest "SmokeShellGreen";
  this addItemToVest "SmokeShellOrange";
  this addItemToVest "SmokeShellPurple";
  this addItemToVest "SmokeShellRed";
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 3 do {this addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
  for "_i" from 1 to 2 do {this addItemToVest "1Rnd_SmokeBlue_Grenade_shell";};
  this addBackpack "tf_rt1523g_black";
  this addHeadgear "rhsusf_ach_helmet_headset_ucp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m4a1_carryhandle_m203S";
  this addPrimaryWeaponItem "rhsusf_acc_compm4";
  this addWeapon "rhsusf_weap_m9";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_anprc152";
  this linkItem "ItemGPS";
};

_team_leader = {
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
  this forceAddUniform "rhs_uniform_cu_ucp";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_epinephrine";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_EarPlugs";};
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addVest "rhsusf_iotv_ucp_Squadleader";
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
  this addItemToVest "SmokeShellBlue";
  this addItemToVest "SmokeShellGreen";
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 3 do {this addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
  for "_i" from 1 to 2 do {this addItemToVest "1Rnd_SmokeBlue_Grenade_shell";};
  this addHeadgear "rhsusf_ach_helmet_headset_ucp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m4a1_carryhandle_m203S";
  this addPrimaryWeaponItem "rhsusf_acc_compm4";
  this addWeapon "rhsusf_weap_m9";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_anprc152";
  this linkItem "ItemGPS";
};

_medic = {
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
  this forceAddUniform "rhs_uniform_cu_ucp";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_epinephrine";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_EarPlugs";};
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addVest "rhsusf_iotv_ucp_Medic";
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 5 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
  this addBackpack "rhsusf_assault_eagleaiii_ucp";
  for "_i" from 1 to 45 do {this addItemToBackpack "ACE_fieldDressing";};
  for "_i" from 1 to 5 do {this addItemToBackpack "ACE_bloodIV_250";};
  for "_i" from 1 to 10 do {this addItemToBackpack "ACE_epinephrine";};
  for "_i" from 1 to 20 do {this addItemToBackpack "ACE_morphine";};
  this addHeadgear "rhsusf_ach_helmet_headset_ucp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m4a1_carryhandle";
  this addPrimaryWeaponItem "rhsusf_acc_compm4";
  this addWeapon "rhsusf_weap_m9";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_anprc152";
  this linkItem "ItemGPS";
};

_autorifleman = {
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
  this forceAddUniform "rhs_uniform_cu_ucp";
  this addItemToUniform "FirstAidKit";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_EarPlugs";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addItemToUniform "ACE_MapTools";
  this addVest "rhsusf_iotv_ucp_SAW";
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_200rnd_556x45_M_SAW";};
  this addBackpack "rhsusf_assault_eagleaiii_ucp";
  for "_i" from 1 to 2 do {this addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
  this addHeadgear "rhsusf_ach_helmet_ucp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m249_pip_L_vfg";
  this addPrimaryWeaponItem "acc_pointer_IR";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_anprc152";
  this linkItem "ItemGPS";
};

_assistant_ar = {
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
  this forceAddUniform "rhs_uniform_cu_ucp";
  this addItemToUniform "FirstAidKit";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_EarPlugs";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_MapTools";
  this addVest "rhsusf_iotv_ucp_Rifleman";
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
  this addBackpack "rhsusf_assault_eagleaiii_ucp";
  for "_i" from 1 to 2 do {this addItemToBackpack "rhs_200rnd_556x45_M_SAW";};
  this addHeadgear "rhsusf_ach_helmet_ucp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m4a1_carryhandle";
  this addPrimaryWeaponItem "rhsusf_acc_compm4";
  this addWeapon "rhsusf_weap_m9";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_anprc152";
  this linkItem "ItemGPS";
};

_rifleman = {
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
  this forceAddUniform "rhs_uniform_cu_ucp";
  this addItemToUniform "FirstAidKit";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_EarPlugs";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_MapTools";
  this addVest "rhsusf_iotv_ucp_Rifleman";
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
  this addHeadgear "rhsusf_ach_helmet_ucp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m4a1_carryhandle";
  this addPrimaryWeaponItem "rhsusf_acc_compm4";
  this addWeapon "rhsusf_weap_m9";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_anprc152";
  this linkItem "ItemGPS";
};

_rifleman_at = {
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
  this forceAddUniform "rhs_uniform_cu_ucp";
  this addItemToUniform "FirstAidKit";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_EarPlugs";};
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "ACE_MapTools";
  this addItemToUniform "rhs_m136_mag";
  this addVest "rhsusf_iotv_ucp_Rifleman";
  for "_i" from 1 to 2 do {this addItemToVest "rhsusf_mag_15Rnd_9x19_JHP";};
  for "_i" from 1 to 10 do {this addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_an_m8hc";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_m67";};
  this addHeadgear "rhsusf_ach_helmet_ucp";

  comment "Add weapons";
  this addWeapon "rhs_weap_m4a1_carryhandle";
  this addPrimaryWeaponItem "rhsusf_acc_compm4";
  this addWeapon "rhs_weap_M136";
  this addWeapon "rhsusf_weap_m9";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_anprc152";
  this linkItem "ItemGPS";
};



_assistant_commander = _commander_must_be_selected;
_squad_leader = _commander_must_be_selected;
_assistant_squad_leader = _commander_must_be_selected;

params ["_role"];
if (!isNil _role) then {call (compile ("call " + _role))} else {diag_log format ["loadouts.sqf - LOADOUT FOR %1 NOT FOUND!", _role]};
