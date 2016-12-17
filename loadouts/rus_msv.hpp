class rus_msv {
	class AllUnits {
        primaryWeapon = "rhs_weap_ak74m";
		primaryWeaponMuzzle = "";
		primaryWeaponOptics = "";
		primaryWeaponPointer = "";
		primaryWeaponUnderbarrel = "";
		secondaryWeapon = "";
		handgunWeapon = "";
		uniform = "rhs_uniform_flora";
        vest = "rhs_6b23_rifleman";
		backpack = "";
		headgear = "rhs_6b26";
		nvgoggles = "";
		radio = "tf_fadak";
        addItemsToUniform[] = {
			LIST_6("ACE_fieldDressing"),
			LIST_2("ACE_morphine"),
			LIST_2("rhs_mag_rdg2_white"),
			"ACE_epinephrine",
			"ACE_Flashlight_KSF1",
			"ACE_key_east",
			"ACE_MapTools"
		};
        addItemsToVest[] = {
			LIST_7("rhs_30Rnd_545x39_AK"),
			LIST_2("rhs_mag_rgo")
		};
        addItemsToBackpack[] = {};
	};

	class Type {
        //rifleman
		class Soldier_F {

		};

        //autorifleman
		class Soldier_AR_F {
			primaryWeapon = "rhs_weap_pkp";
			backpack = "rhs_assault_umbts";
			headgear = "rhs_6b26_ess";
			addItemsToVest[] = {
				LIST_2("rhs_mag_rgo"),
				"rhs_100Rnd_762x54mmR"
			};
			addItemsToBackpack[] = {
				LIST_2("rhs_100Rnd_762x54mmR_green"),
				"rhs_100Rnd_762x54mmR"
			};
		};

        //light AT
		class Soldier_LAT_F {
			secondaryWeapon = "rhs_weap_rpg26";
		};

        //ammo bearer
		class Soldier_A_F {
			backpack = "rhs_assault_umbts";
			addItemsToBackpack[] = {
				LIST_2("rhs_100Rnd_762x54mmR_green")
			};
		};

        //medic
		class Medic_F {
			backpack = "rhs_assault_umbts";
			addItemsToBackpack[] = {
				LIST_20("ACE_fieldDressing"),
				LIST_10("ACE_fieldDressing"),
				LIST_15("ACE_morphine"),
				LIST_15("ACE_epinephrine"),
				LIST_2("ACE_bloodIV_250")
			};
		};

        //squad leader
        class Soldier_SL_F {
			primaryWeaponOptics = "rhs_acc_1p63";
			vest = "rhs_6b23_6sh92_headset_mapcase";
			backpack = "tf_mr3000_rhs";
			headgear = "rhs_6b26_ess";
			addItemsToBackpack[] =  {
				LIST_3("rhs_mag_rdg2_black"),
				LIST_3("rhs_mag_rdg2_white")
			};
        };

        //team leader
		class Soldier_TL_F {
			primaryWeapon = "rhs_weap_ak74m_gp25";
			primaryWeaponOptics = "rhs_acc_1p63";
			vest = "rhs_6b23_6sh92_headset";
			backpack = "rhs_assault_umbts";
			headgear = "rhs_6b26_ess";
			addItemsToBackpack[] = {
				LIST_2("rhs_GRD40_White"),
				LIST_2("rhs_GRD40_Green"),
				LIST_2("rhs_GRD40_Red")
			};
		};
	};
};
