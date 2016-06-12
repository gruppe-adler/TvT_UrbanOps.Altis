/*  Item config
*
*   Data syntax:
*   0:  display name
*   1:  price
*   2:  description
*   3:  code
*   4:  picture or classname
*   5:  available amount
*/


BM_HIGHESTCATID_WEST = 3;

BM_CATEGORYNAME_WEST_0 = "Weapons";
BM_ITEMDATA_WEST_0 = [
  ["Mk153 SMAW", 2000, "The SMAW is a shoulder-launched rocket weapon with the primary function of being a portable assault weapon and a secondary anti-armor rocket launcher.", {[_this select 0, _this select 1, "rhs_weap_smaw_green"] remoteExec ["mcd_fnc_bmBuyWeapon", 0, false]}, "rhs_weap_smaw_green", 10],
  ["M136 (HEAT)", 2000, "The M136 is an 84-mm unguided, portable, single-shot launcher. The high explosive anti tank projectile can penetrate up to 420 mm of RHA.", {[_this select 0, _this select 1, "rhs_weap_M136"] remoteExec ["mcd_fnc_bmBuyWeapon", 0, false]}, "rhs_weap_M136", 10],
  ["M136 (HEDP)", 2000, "The M136 is an 84-mm unguided, portable, single-shot launcher. The high explosive dual purpose projectile is used against bunkers, buildings and personnel.", {[_this select 0, _this select 1, "rhs_weap_M136_hedp"] remoteExec ["mcd_fnc_bmBuyWeapon", 0, false]}, "rhs_weap_M136_hedp", 10],
  ["M136 (HP)", 2000, "The M136 is an 84-mm unguided, portable, single-shot launcher. The high penetration projectile can penetrate up to 600mm of RHA.", {[_this select 0, _this select 1, "rhs_weap_M136_hp"] remoteExec ["mcd_fnc_bmBuyWeapon", 0, false]}, "rhs_weap_M136_hp", 10],
  ["M240G", 2000, "The M240 is a belt-fed, gas-operated general purpose machine gun firing the 7.62x51mm NATO cartridge.<br/>Weight: 12kg.<br/>Rate of fire: 800 rounds/min.<br/>Effective range: 800m.", {[_this select 0, _this select 1, "rhs_weap_m240G"] remoteExec ["mcd_fnc_bmBuyWeapon", 0, false]}, "rhs_weap_m240G", 10],
  ["Mk11 Mod 0 + 3x red dot", 2000, "The Mk 11 Mod 0 is a semi automatic designated marksman rifle firing the 7.62x51mm NATO cartridge. Comes with Aimpoint red dot sight and 3x magnifier.", {[_this select 0, _this select 1, "rhs_weap_sr25", "FHQ_optic_AimM_BLK"] remoteExec ["mcd_fnc_bmBuyWeapon", 0, false]}, "rhs_weap_sr25", 10]
];

BM_CATEGORYNAME_WEST_1 = "Attachments";
BM_ITEMDATA_WEST_1 = [
  ["SMAW MK42 Sight", 2000, "Optical sight for the SMAW launcher with 4x magnification.", {[_this select 0, _this select 1, "rhs_weap_optic_smaw"] remoteExec ["mcd_fcn_bmBuyItem", 0, false]}, "rhs_weap_optic_smaw", 5],
  ["Harris Bipod", 2000, "Hinged base, extendable legs, quick detach bipod. Made by Harris Engineering.", {[_this select 0, _this select 1, "rhsusf_acc_harris_bipod"] remoteExec ["mcd_fcn_bmBuyItem", 0, false]}, "rhsusf_acc_harris_bipod", 5],
  ["Mk11 Mod 0 Suppressor", 2000, "Used on: Mk11 <br/>7.62 suppressor made for SR-25 rifle variants.", {[_this select 0, _this select 1, "rhsusf_acc_SR25S"] remoteExec ["mcd_fcn_bmBuyItem", 0, false]}, "rhsusf_acc_SR25S", 5],
  ["NT4 5.56 Suppressor", 2000, "Used on: M4A1 <br/>Knight's Armament NT4 QDSS suppressor. Reduces rifle signature by up to 28dB.", {[_this select 0, _this select 1, "rhsusf_acc_nt4_black"] remoteExec ["mcd_fcn_bmBuyItem", 0, false]}, "rhsusf_acc_nt4_black", 5]
];

BM_CATEGORYNAME_WEST_2 = "Ammo";
BM_ITEMDATA_WEST_2 = [
  ["7.62 M80 Ball 100Rnd Belt", 1000, "Used in: M240 <br/>147-grain (9.5 g) 7.62×51mm NATO ball cartridge. 100 round disintegrating belt. Standard M240 cartridge.", {[_this select 0, _this select 1, "rhsusf_100Rnd_762x51"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhsusf_100Rnd_762x51", 5],
  ["7.62 M62 Trc 100Rnd Belt", 1000, "Used in: M240 <br/>142-grain (9.2 g) 7.62×51mm NATO tracer cartridge. 100 round disintegrating belt.", {[_this select 0, _this select 1, "rhsusf_100Rnd_762x51_m62_tracer"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhsusf_100Rnd_762x51_m62_tracer", 5],
  ["7.62 M61 AP 50Rnd Belt", 1000, "Used in: M240 <br/>150.5-grain (9.8 g) 7.62×51mm NATO armor-piercing round. 50 round disintegrating belt.", {[_this select 0, _this select 1, "rhsusf_50Rnd_762x51_m61_ap"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhsusf_50Rnd_762x51_m61_ap", 5],
  ["7.62 M118 Match 20Rnd", 1000, "Used in: Mk11 <br/>173-grain (11.2 g) 7.62×51mm NATO Full Metal Jacket Boat Tail round specifically designed for match purposes.", {[_this select 0, _this select 1, "rhsusf_20Rnd_762x51_m118_special_Mag"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhsusf_20Rnd_762x51_m118_special_Mag", 5],
  ["7.62 M62 Tracer 20Rnd", 1000, "Used in: Mk11 <br/>142-grain (9.2 g) 7.62×51mm NATO tracer cartridge.", {[_this select 0, _this select 1, "rhsusf_20Rnd_762x51_m62_Mag"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhsusf_20Rnd_762x51_m62_Mag", 5],
  ["7.62 M993 AP 20Rnd", 1000, "Used in: Mk11 <br/>126.6 grains (8.2 g) 7.62×51mm NATO armor-piercing round.", {[_this select 0, _this select 1, "rhsusf_20Rnd_762x51_m993_Mag"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhsusf_20Rnd_762x51_m993_Mag", 5],
  ["AN M8HC Smoke Grenade", 1000, "The AN-M8 Smoke Grenade is a U.S. military grenade used as a ground-to-ground or ground to air concealment or signaling device.", {[_this select 0, _this select 1, "rhs_mag_an_m8hc"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_mag_an_m8hc", 5],
  ["M118 Demo Block", 1000, "The M118 block demolition charge, or sheet explosive, is a block of four .50-pound sheets of flexible explosive packed in a plastic envelope.", {[_this select 0, _this select 1, "DemoCharge_Remote_Mag"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "DemoCharge_Remote_Mag", 5],
  ["M67 Grenade", 1000, "The M67 grenade is a fragmentation hand grenade used by the United States military.", {[_this select 0, _this select 1, "rhs_mag_m67"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_mag_m67", 5],
  ["SMAW Spotting Rounds", 1000, "Used in: SMAW <br/>5x SMAW MK217 spotting rounds. Ballistically matched to the rocket. Serve to increase the gunner's first-round hit probability.", {[_this select 0, _this select 1, "rhs_mag_smaw_SR"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_mag_smaw_SR", 5],
  ["SMAW HEAA Rocket", 1000, "Used in: SMAW <br/>SMAW rocket with high explosive anti armor warhead. Capable of penetrating 600mm of RHA.", {[_this select 0, _this select 1, "rhs_mag_smaw_HEAA"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_mag_smaw_HEAA", 5],
  ["SMAW HEDP Rocket", 1000, "Used in: SMAW <br/>SMAW rocket with high explosive dual purpose warhead. Effective against bunkers, brick or concrete walls and light armor.", {[_this select 0, _this select 1, "rhs_mag_smaw_HEDP"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_mag_smaw_HEDP", 5]
];

BM_CATEGORYNAME_WEST_3 = "Items";
BM_ITEMDATA_WEST_3 = [
  ["Defusal Kit", 1000, "Allows defusing of explosives.", {[_this select 0, _this select 1, "ACE_DefusalKit"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "ACE_DefusalKit", 5],
  ["M57 Firing Device", 1000, "The M57 electrcal firing device is more commonly referred to as The Clacker. Used to remotely trigger explosives.", {[_this select 0, _this select 1, "ACE_Clacker"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "ACE_Clacker", 5],
  ["Mine Detector", 1000, "Detects all mines in range.", {[_this select 0, _this select 1, "MineDetector"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "MineDetector", 5],
  ["Wirecutter", 1000, "Used to cut down fences.", {[_this select 0, _this select 1, "ACE_wirecutter"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "ACE_wirecutter", 5]
];
