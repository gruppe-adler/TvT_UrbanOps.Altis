class CfgGradBuymenu {
    class blu_us_army {
        class Weapons {
            displayName = "Weapons";
            kindOf = "Weapons";

            class rhs_weap_M136 {
                displayName = "M136 (HEAT)";
                description = "The M136 is an 84-mm unguided, portable, single-shot launcher. The high explosive anti tank projectile can penetrate up to 420 mm of RHA.";
                price = 2000;
                stock = 4;
                code = "";
            };

            class rhs_weap_m240G {
                displayName = "M240G";
                description = "The M240 is a belt-fed, gas-operated general purpose machine gun firing the 7.62x51mm NATO cartridge.";
                price = 2500;
                stock = 5;
                code = "";
                muzzleItem = "";
                opticsItem = "";
                pointerItem = "";
                underbarrelItem = "";
            };
        };
        class Ammo {
            displayName = "Ammo";
            kindOf = "Items";

            class rhs_mag_30Rnd_556x45_Mk262_Stanag {
                displayName = "5.56 Mk262 30Rnd";
                description = "Used in: M4 variants. <br/>77-grain (5.0 g) 5.56x45mm NATO match grade cartridge. More effective at longer ranges than the standard issue M855 round.";
                amount = 1;
                price = 100;
                stock = 40;
                code = "";
            };
        };

        class Items {
            displayName = "Items";
            kindOf = "Items";

            class ACE_fieldDressing {
                displayName = "Bandages (x10)";
                description = "10 simple bandages in sterile packaging.";
                amount = 10;
                price = 100;
                stock = 40;
                code = "";
            };
        };

        class Apparel {
            displayName = "Apparel";
            kindOf = "Wearables";

            class B_AssaultPack_khk {
                displayName = "Assault Backpack (khaki)";
                description = "A comparatively small, but very light backpack.";
                price = 200;
                stock = 10;
                code = "";
            };

            class U_B_CombatUniform_mcam_vest {
                displayName = "Recon Fatigues";
                description = "Vanilla NATO uniform.";
                price = 800;
                stock = 4;
            };
        };

        class Vehicles {
            displayName = "Vehicles";
            kindOf = "Vehicles";

            class C_Hatchback_01_sport_F {
                displayName = "Hatchback (Sport)";
                description = "This thing is quick";
                price = 4000;
                stock = 10;
                code = "(_this select 2) setFuel 0.5";
                spawnEmpty = true;
            };
        };

        class Units {
            displayname = "Units";
            kindOf = "Units";

            class B_Soldier_SL_F {
                displayName = "NATO Squadleader (x3)";
                description = "This is a team of NATO squad leaders.";
                price = 3000;
                amount = 3;
                stock = 5;
                code = "{_x removeWeaponGlobal (primaryWeapon _x)} forEach units (_this select 2)";
            };
        };
    };
};
