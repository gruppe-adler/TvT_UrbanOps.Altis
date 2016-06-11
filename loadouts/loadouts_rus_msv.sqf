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
  this forceAddUniform "rhs_uniform_msv_emr";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addItemToUniform "ACE_EarPlugs";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  for "_i" from 1 to 2 do {this addItemToUniform "rhs_mag_9x19_17";};
  this addVest "rhs_6b23_digi_vydra_3m";
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_rgd5";};
  for "_i" from 1 to 9 do {this addItemToVest "rhs_30Rnd_545x39_AK";};
  this addBackpack "tf_bussole";
  for "_i" from 1 to 4 do {this addItemToBackpack "rhs_GRD40_Red";};
  for "_i" from 1 to 3 do {this addItemToBackpack "rhs_GRD40_Green";};
  this addHeadgear "rhs_6b28";

  comment "Add weapons";
  this addWeapon "rhs_weap_ak74m_gp25";
  this addPrimaryWeaponItem "rhs_acc_dtk";
  this addPrimaryWeaponItem "rhs_acc_pkas";
  this addWeapon "rhs_weap_pya";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_fadak";
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
  this forceAddUniform "rhs_uniform_msv_emr";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addItemToUniform "ACE_EarPlugs";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  for "_i" from 1 to 2 do {this addItemToUniform "rhs_mag_9x19_17";};
  this addVest "rhs_6b23_digi_vydra_3m";
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_rgd5";};
  for "_i" from 1 to 9 do {this addItemToVest "rhs_30Rnd_545x39_AK";};
  this addBackpack "rhs_assault_umbts";
  for "_i" from 1 to 4 do {this addItemToBackpack "rhs_GRD40_Red";};
  for "_i" from 1 to 4 do {this addItemToBackpack "rhs_GRD40_Green";};
  for "_i" from 1 to 4 do {this addItemToBackpack "rhs_mag_rdg2_black";};
  for "_i" from 1 to 3 do {this addItemToBackpack "rhs_mag_rdg2_white";};
  this addHeadgear "rhs_6b28";

  comment "Add weapons";
  this addWeapon "rhs_weap_ak74m_gp25";
  this addPrimaryWeaponItem "rhs_acc_dtk";
  this addPrimaryWeaponItem "rhs_acc_pkas";
  this addWeapon "rhs_weap_pya";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_fadak";
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
  this forceAddUniform "rhs_uniform_msv_emr";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addItemToUniform "ACE_EarPlugs";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "rhs_mag_9x19_17";
  this addVest "rhs_6b23_digi_medic";
  for "_i" from 1 to 8 do {this addItemToVest "rhs_30Rnd_545x39_AK";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_rgd5";};
  this addItemToVest "rhs_mag_rdg2_white";
  this addBackpack "rhs_assault_umbts";
  for "_i" from 1 to 45 do {this addItemToBackpack "ACE_fieldDressing";};
  for "_i" from 1 to 5 do {this addItemToBackpack "ACE_bloodIV_250";};
  for "_i" from 1 to 10 do {this addItemToBackpack "ACE_epinephrine";};
  for "_i" from 1 to 20 do {this addItemToBackpack "ACE_morphine";};
  this addHeadgear "rhs_6b28";

  comment "Add weapons";
  this addWeapon "rhs_weap_ak74m";
  this addPrimaryWeaponItem "rhs_acc_dtk";
  this addPrimaryWeaponItem "rhs_acc_pkas";
  this addWeapon "rhs_weap_pya";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_fadak";
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
  this forceAddUniform "rhs_uniform_msv_emr";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addItemToUniform "ACE_EarPlugs";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addVest "rhs_6b23_digi_vydra_3m";
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_rgd5";};
  this addItemToVest "rhs_mag_rdg2_white";
  this addItemToVest "rhs_100Rnd_762x54mmR";
  this addBackpack "rhs_assault_umbts";
  for "_i" from 1 to 3 do {this addItemToBackpack "rhs_100Rnd_762x54mmR";};
  this addHeadgear "rhs_6b28";

  comment "Add weapons";
  this addWeapon "rhs_weap_pkp";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_fadak";
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
  this forceAddUniform "rhs_uniform_msv_emr";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addItemToUniform "ACE_EarPlugs";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "rhs_mag_9x19_17";
  this addVest "rhs_6b23_digi_vydra_3m";
  for "_i" from 1 to 8 do {this addItemToVest "rhs_30Rnd_545x39_AK";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_rgd5";};
  this addItemToVest "rhs_mag_rdg2_white";
  this addHeadgear "rhs_6b28";
  this addBackpack "rhs_assault_umbts";
  for "_i" from 1 to 3 do {this addItemToBackpack "rhs_100Rnd_762x54mmR";};

  comment "Add weapons";
  this addWeapon "rhs_weap_ak74m";
  this addPrimaryWeaponItem "rhs_acc_dtk";
  this addPrimaryWeaponItem "rhs_acc_pkas";
  this addWeapon "rhs_weap_pya";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_fadak";
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
  this forceAddUniform "rhs_uniform_msv_emr";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addItemToUniform "ACE_EarPlugs";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "rhs_mag_9x19_17";
  this addVest "rhs_6b23_digi_vydra_3m";
  for "_i" from 1 to 8 do {this addItemToVest "rhs_30Rnd_545x39_AK";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_rgd5";};
  this addItemToVest "rhs_mag_rdg2_white";
  this addHeadgear "rhs_6b28";

  comment "Add weapons";
  this addWeapon "rhs_weap_ak74m";
  this addPrimaryWeaponItem "rhs_acc_dtk";
  this addPrimaryWeaponItem "rhs_acc_pkas";
  this addWeapon "rhs_weap_pya";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_fadak";
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
  this forceAddUniform "rhs_uniform_msv_emr";
  for "_i" from 1 to 10 do {this addItemToUniform "ACE_fieldDressing";};
  for "_i" from 1 to 2 do {this addItemToUniform "ACE_CableTie";};
  this addItemToUniform "ACE_EarPlugs";
  this addItemToUniform "ACE_MapTools";
  for "_i" from 1 to 4 do {this addItemToUniform "ACE_morphine";};
  this addItemToUniform "rhs_mag_9x19_17";
  this addVest "rhs_6b23_digi_vydra_3m";
  for "_i" from 1 to 8 do {this addItemToVest "rhs_30Rnd_545x39_AK";};
  for "_i" from 1 to 2 do {this addItemToVest "rhs_mag_rgd5";};
  this addItemToVest "rhs_mag_rdg2_white";
  this addHeadgear "rhs_6b28";

  comment "Add weapons";
  this addWeapon "rhs_weap_ak74m";
  this addPrimaryWeaponItem "rhs_acc_dtk";
  this addPrimaryWeaponItem "rhs_acc_pkas";
  this addWeapon "rhs_weap_pya";
  this addWeapon "rhs_weap_rpg26";
  this addWeapon "Binocular";

  comment "Add items";
  this linkItem "ItemMap";
  this linkItem "ItemCompass";
  this linkItem "ItemWatch";
  this linkItem "tf_fadak";
  this linkItem "ItemGPS";
};

_assistant_commander = _commander_must_be_selected;
_squad_leader = _commander_must_be_selected;
_assistant_squad_leader = _commander_must_be_selected;

params ["_role"];
if (!isNil _role) then {call (compile ("call " + _role))} else {diag_log format ["loadouts.sqf - LOADOUT FOR %1 NOT FOUND!", _role]};
