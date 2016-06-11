/*    ["Item 0", 5000, "Dies ist  Item 0", {hint "item0 category 0 gekauft!"}, "hgun_PDW2000_F"],
      ["Item 1", 7000, "Dies ist  Item 1", {hint "item1 category 0 gekauft!"}, "player\buymenu\pictures\test.paa"]
*/

BM_HIGHESTCATID_WEST = 1;

BM_CATEGORYNAME_WEST_0 = "Weapons";
BM_ITEMDATA_WEST_0 = [
  ["Mk153 SMAW", 2000, "The SMAW is a shoulder-launched rocket weapon with the primary function of being a portable assault weapon and a secondary anti-armor rocket launcher.", {[_this select 0, _this select 1, "rhs_weap_smaw_green"] remoteExec ["mcd_fnc_bmBuyWeapon", 0, false]}, "rhs_weap_smaw_green"],
  ["SMAW MK42 Sight", 2000, "Optical sight for the SMAW launcher with 4x magnification.", {[_this select 0, _this select 1, "rhs_weap_optic_smaw"] remoteExec ["mcd_fcn_bmBuyItem", 0, false]}, "rhs_weap_optic_smaw"],
  ["SMAW Ammo (Spotting)", 1000, "5x SMAW MK217 spotting rounds. Ballistically matched to the rocket. Serve to increase the gunner's first-round hit probability.", {[_this select 0, _this select 1, "rhs_mag_smaw_SR"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_mag_smaw_SR"],
  ["SMAW Ammo (HEAA)", 1000, "SMAW rocket with high explosive anti armor warhead. Capable of penetrating 600mm RHA.", {[_this select 0, _this select 1, "rhs_mag_smaw_HEAA"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_mag_smaw_HEAA"],
  ["SMAW Ammo (HEDP)", 1000, "SMAW rocket with high explosive dual purpose warhead. Effective against bunkers, brick or concrete walls and light armor.", {[_this select 0, _this select 1, "rhs_mag_smaw_HEDP"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_mag_smaw_HEDP"]
];
BM_ITEMAMOUNT_WEST_0 = [
  10,
  5,
  5,
  5,
  5
];

BM_CATEGORYNAME_WEST_1 = "Things";
BM_ITEMDATA_WEST_1 = [
  ["Item 10", 3000, "Dies ist  Item 10", {hint "item0 category 1 gekauft!"}, "U_B_CombatUniform_mcam"]
];
BM_ITEMAMOUNT_WEST_1 = [
  2
];
