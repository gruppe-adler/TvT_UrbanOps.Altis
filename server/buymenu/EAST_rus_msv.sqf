/*  Item config
*
*   Data syntax:
*   0:  display name
*   1:  price
*   2:  description
*   3:  code
*   4:  picture or classname
*   5:  available amount
*
*   Template:
["", , "", {}, ,],
*/


BM_CATEGORYNAME_EAST_0 = "Weapons";
BM_ITEMDATA_EAST_0 = [
  ["PKP", 2000, "The PKP is a Russian General-purpose machine gun chambered for the 7.62×54mmR round.<br/>Weight: 8.2kg.<br/>Rate of fire: 700 rounds/min.<br/>Effective range: 1500m.", {[_this select 0, _this select 1, "rhs_weap_pkp"] remoteExec ["mcd_fnc_bmBuyWeapon", 0, false]}, "rhs_weap_pkp", 10],
  ["RPG-26", 2000, "The RPG-26 Aglen is a disposable anti-tank rocket launcher. The rocket carries a 72.5 millimeter diameter high explosive anti-tank single shaped charge warhead capable of penetrating 440mm RHA. It has a maximum effective range of around 250 meters.", {[_this select 0, _this select 1, "rhs_weap_rpg26"] remoteExec ["mcd_fnc_bmBuyWeapon", 0, false]}, "rhs_weap_rpg26", 10],
  ["RPG-7", 2000, "The RPG-7 is a portable, reusable, unguided, shoulder-launched, anti-tank rocket-propelled grenade launcher.", {[_this select 0, _this select 1, "rhs_weap_rpg7"] remoteExec ["mcd_fnc_bmBuyWeapon", 0, false]}, "rhs_weap_rpg7", 10],
  ["SVDM + 3x red dot", 2000, "The Dragunov sniper rifle is a semi-automatic sniper/designated marksman rifle chambered in 7.62×54mmR. Comes with Aimpoint red dot sight and 3x magnifier.", {[_this select 0, _this select 1, "rhs_weap_svdp_npz", "FHQ_optic_AimM_BLK"] remoteExec ["mcd_fnc_bmBuyWeapon", 0, false]}, "rhs_weap_svdp_npz", 10],
  ["Kord Gun Bag", 1000, "The Kord 12.7mm heavy machine gun is a Russian design replacing the older NSV machine gun. Comes with 5x50 round belts.<br/>Weight: 11.3kg.<br/>Rate of fire: 700 rounds/min.<br/>Effective range: 2000m.", {[_this select 0, _this select 1, "RHS_Kord_Gun_Bag"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "RHS_Kord_Gun_Bag", 5],
  ["Kord Tripod Bag", 1000, "6T7 low tripod for the Kord machine gun.<br/>Weight: 20.4kg.", {[_this select 0, _this select 1, "RHS_Kord_Tripod_Bag"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "RHS_Kord_Tripod_Bag", 5]
];


BM_CATEGORYNAME_EAST_1 = "Attachments";
BM_ITEMDATA_EAST_1 = [
  ["DTK-4 5.45 Suppressor", 2000, "Used on: AK74M variants. <br/>187mm rifle suppressor for the 5.45x39 round.", {[_this select 0, _this select 1, "rhs_acc_dtk4short"] remoteExec ["mcd_fcn_bmBuyItem", 0, false]}, "rhs_acc_dtk4short", 5],
  ["RPG-7 PGO-7V3 Sight", 2000, "Optical sight for the RPG-7 launcher with 2.7x magnification.", {[_this select 0, _this select 1, "rhs_acc_pgo7v"] remoteExec ["mcd_fcn_bmBuyItem", 0, false]}, "rhs_acc_pgo7v", 5]
];

BM_CATEGORYNAME_EAST_2 = "Ammo";
BM_ITEMDATA_EAST_2 = [
  ["5.45 7N10 30Rnd", 1000, "Used in: AK74M variants. <br/>56-grain (3.6 g) 5.45x39mm improved penetration cartridge. Replaced the old 5N7 cartridge.", {[_this select 0, _this select 1, "rhs_30Rnd_545x39_7N10_AK"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_30Rnd_545x39_7N10_AK", 5],
  ["7.62 7N1 10Rnd", 1000, "Used in: SVD variants. <br/>151-grain (9.8 g) 7.62x54mmR sniper cartridge. Improved accuracy over conventional 7.62 rounds.", {[_this select 0, _this select 1, "rhs_10Rnd_762x54mmR_7N1"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_10Rnd_762x54mmR_7N1", 5],
  ["7.62 57-N 100Rnd Belt", 1000, "Used in: PKP<br/>148-grain (9.6 g) conventional steel-core bullet. Designed to engage personnel and weapon systems.", {[_this select 0, _this select 1, "rhs_100Rnd_762x54mmR"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_100Rnd_762x54mmR", 5],
  ["7.62 7T2 100Rnd Belt", 1000, "Used in: PKP<br/>148-grain (9.6 g) tracer cartridge. Designed for fire adjustment and target designation.", {[_this select 0, _this select 1, "rhs_100Rnd_762x54mmR_green"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_100Rnd_762x54mmR_green", 5],
  ["7.62 7N13 100Rnd Belt", 1000, "Used in: PKP<br/>148-grain (9.6 g) armor piercing cartridge. Designed to kill personnel wearing body armor, featuring a heat-strengthened core.", {[_this select 0, _this select 1, "rhs_100Rnd_762x54mmR_7N13"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_100Rnd_762x54mmR_7N13", 5],
  ["RDG-2 Smoke Grenade", 1000, "The RDH-2 is a simple Russian military smoke greande. It has a cardboard body with pull tapes on each side.", {[_this select 0, _this select 1, "rhs_mag_rdg2_white"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_mag_rdg2_white", 5],
  ["RDG-5 Grenade", 1000, "The RGD-5 'Long-Range Han Grenade', is a post-World War II Soviet anti-personnel fragmentation grenade, designed in the early 1950s.", {[_this select 0, _this select 1, "rhs_mag_rgd5"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_mag_rgd5", 5],
  ["RPG PG-7VL", 1000, "Used in: RPG-7 <br/>Improved 93 mm HEAT warhead effective against most vehicles and fortified targets.", {[_this select 0, _this select 1, "rhs_rpg7_PG7VL_mag"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_rpg7_PG7VL_mag", 5],
  ["RPG PG-7VR", 1000, "Used in: RPG-7 <br/>Dual 64 mm/105 mm HEAT warhead for defeating modern armored vehicles equipped with reactive armor blocks.", {[_this select 0, _this select 1, "rhs_rpg7_PG7VR_mag"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_rpg7_PG7VR_mag", 5],
  ["RPG OG-7V", 1000, "Used in: RPG-7 <br/>40 mm fragmentation warhead for anti-personnel warfare.", {[_this select 0, _this select 1, "rhs_rpg7_OG7V_mag"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_rpg7_OG7V_mag", 5],
  ["RPG TBG-7V", 1000, "Used in: RPG-7 <br/>105 mm Thermobaric warhead for anti-personnel and urban warfare.", {[_this select 0, _this select 1, "rhs_rpg7_TBG7V_mag"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_rpg7_TBG7V_mag", 5],
  ["PMN-2 Mine", 1000, "The PMN-2 is a Russian anti-personnel mine. The filling is an RDX/TNT based explosive that is unusually large when compared to many other anti-personnel landmines.", {[_this select 0, _this select 1, "rhs_mine_pmn2_mag"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_mine_pmn2_mag", 5],
  ["PMR-3 Mine", 1000, "The PMR-3 is an anti-personnel stake mine, triggered by a tripwire. It has a greater effective radius than a PMN-2, but is easier to spot on open ground.", {[_this select 0, _this select 1, "APERSTripMine_Wire_Mag"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "APERSTripMine_Wire_Mag", 5],
  ["TM-62M Mine", 1000, "The TM-62M is a Russian anti-tank blast mine. Infantry will be unable to trigger it. Weight: 4.5kg.", {[_this select 0, _this select 1, "rhs_mine_tm62m_mag"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "rhs_mine_tm62m_mag", 5]
];

BM_CATEGORYNAME_EAST_3 = "Items";
BM_ITEMDATA_EAST_3 = [
  ["M57 Firing Device", 1000, "The M57 electrcal firing device is more commonly referred to as The Clacker. Used to remotely trigger explosives.", {[_this select 0, _this select 1, "ACE_Clacker"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "ACE_Clacker", 5],
  ["Wirecutter", 1000, "Mechanical wirecutter used to cut down fences. Heavy but sturdy. Weight: 3kg.", {[_this select 0, _this select 1, "ACE_wirecutter"] remoteExec ["mcd_fnc_bmBuyItem", 0, false]}, "ACE_wirecutter", 5]
];
