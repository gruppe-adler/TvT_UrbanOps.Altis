class CLASSNAME {
	class AllUnits {
        primaryWeapon = "";
		primaryWeaponMagazine = "";
		primaryWeaponMuzzle = "";
		primaryWeaponOptics = "";
		primaryWeaponPointer = "";
		primaryWeaponUnderbarrel = "";
		secondaryWeapon = "";
		handgunWeapon = "";
		handgunWeaponMagazine = "";
		uniform = "";
        vest = "";
		backpack = "";
		headgear = "";
		nvgoggles = "";
		radio = "";
		binoculars = "Binocular";
		map = "ItemMap";
		gps = "ItemGPS";
		compass = "ItemCompass";
        addItemsToUniform[] = {};
        addItemsToVest[] = {};
        addItemsToBackpack[] = {};
	};

	class Type {
        //rifleman
		class Soldier_F {

		};

        //autorifleman
		class Soldier_AR_F: Soldier_F {

		};

        //light AT
		class Soldier_LAT_F: Soldier_F {

		};

        //ammo bearer
		class Soldier_A_F: Soldier_F {

		};

        //medic
		class Medic_F: Soldier_F {

		};

        //squad leader
        class Soldier_SL_F: Soldier_F {

        };

        //team leader
		class Soldier_TL_F: Soldier_F {

		};
	};

	class Rank {
		class LIEUTENANT {

		};
	};
};

class CLASSNAME: CLASSNAME {
	class AllUnits: AllUnits {
        primaryWeapon = "";
		primaryWeaponMuzzle = "";
		primaryWeaponOptics = "";
		primaryWeaponPointer = "";
		primaryWeaponUnderbarrel = "";
		secondaryWeapon = "";
		handgunWeapon = "";
		uniform = "";
        vest = "";
		backpack = "";
		headgear = "";
		nvgoggles = "";
		radio = "";
        addItemsToUniform[] = {};
        addItemsToVest[] = {};
        addItemsToBackpack[] = {};
	};

	class Type: Type {
        //rifleman
		class Soldier_F: Soldier_F {

		};

        //autorifleman
		class Soldier_AR_F: Soldier_AR_F {

		};

        //light AT
		class Soldier_LAT_F: Soldier_LAT_F {

		};

        //ammo bearer
		class Soldier_A_F: Soldier_A_F {

		};

        //medic
		class Medic_F: Medic_F {

		};

        //squad leader
        class Soldier_SL_F: Soldier_SL_F {

        };

        //team leader
		class Soldier_TL_F: Soldier_TL_F {

		};
	};

	class Rank: Rank {
		class LIEUTENANT: LIEUTENANT {

		};
	};
};
