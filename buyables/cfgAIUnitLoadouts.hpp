#include "..\list_macros.hpp"

class cfgAIUnitLoadouts {
    class ind_me_terrorists {
        class baseAI {
            uniform[] = {
                "LOP_U_AM_Fatigue_01_3",
                "LOP_U_AM_Fatigue_02_5",
                "LOP_U_AM_Fatigue_01_5",
                "LOP_U_AM_Fatigue_02_6",
                "LOP_U_AM_Fatigue_02_2",
                "LOP_U_AM_Fatigue_02",
                "LOP_U_AM_Fatigue_01"
            };
            headgear[] = {
                "LOP_H_Shemag_BLK",
                "LOP_H_Shemag_GRE",
                "LOP_H_Shemag_OLV",
                "LOP_H_Shemag_TAN",
                "LOP_H_Turban",
                "LOP_H_Turban_mask",
                "LOP_H_Pakol"
            };
            vest = "";
            backpack = "";

            primaryWeapon = "rhs_weap_m38";
            addItemsToUniform[] = {
                LIST_12("rhsgref_5Rnd_762x54_m38"),
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_morphine")
            };
        };

        class marksman: baseAI {};
        class rifleman: baseAI {};
        class riflemanAT: baseAI {
            secondaryWeapon = "rhs_weap_rpg26";
        };
        class autorifleman: baseAI {
            primaryWeapon = "rhs_weap_akm";
            addItemsToUniform[] = {
                LIST_8("rhs_30Rnd_762x39mm"),
                "rhs_mag_rgo"
            };
        };
        class suicideBomber: baseAI {
            primaryWeapon = "";
            addItemsToUniform[] = {};
            vest = "LOP_6sh46";
            addItemsToVest[] = {
                "DemoCharge_Remote_Mag"
            };
        };
    };
};
