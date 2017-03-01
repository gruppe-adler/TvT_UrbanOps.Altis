class Units {
    displayName = "Units";
    kindOf = "Units";

    class O_soldier_M_F {
        displayName = "Marksman";
        description = "A marksman armed with a Mosin Nagant. High skill in aiming and spotting.";
        picture = "\po_main\Data\3den\LOP_ISTS_Infantry_B_Rifleman_2.jpg";
        price = 400;
        stock = 10;
        code = "[_this select 2,'marksman'] call uo_buyables_fnc_equipAIGroup";
    };

    class O_Soldier_LAT_F {
        displayName = "Rifleman (AT)";
        description = "A simple rifleman armed with a Mosin Nagant and an RPG-26";
        picture = "\po_main\Data\3den\LOP_ISTS_Infantry_AT.jpg";
        price = 1000;
        stock = 10;
        code = "[_this select 2,'riflemanAT'] call uo_buyables_fnc_equipAIGroup";
    };

    class O_Survivor_F {
        displayName = "Suicide Bomber";
        description = "A suicide bomber that will blow up the first enemy he sees.";
        picture = "\po_main\Data\3den\LOP_Tak_Civ_Man_04.jpg";
        price = 1000;
        stock = 10;
        code = "[_this select 2,'suicideBomber'] call uo_buyables_fnc_equipAIGroup; {[_x] call uo_buyables_fnc_initSuicideBomber} forEach units (_this select 2)";
    };

    class O_Soldier_F {
        displayName = "Rifleman (Mosin) Team";
        description = "3 riflemen armed with Mosin Nagants";
        picture = "\po_main\Data\3den\LOP_ISTS_Infantry_B_Rifleman_2.jpg";
        price = 1000;
        amount = 3;
        stock = 10;
        code = "[_this select 2,'rifleman'] call uo_buyables_fnc_equipAIGroup";
    };

    class O_Soldier_AR_F {
        displayName = "Rifleman (AKM) Team";
        description = "3 riflemen armed with AKMs";
        picture = "\po_main\Data\3den\LOP_ISTS_Infantry_TL.jpg";
        price = 3000;
        amount = 3;
        stock = 10;
        code = "[_this select 2,'autorifleman'] call uo_buyables_fnc_equipAIGroup";
    };

    class O_Soldier_lite_F {
        displayName = "Rifleman (Mixed) Group";
        description = "7 riflemen armed with AKMs and Mosin Nagants";
        picture = "\po_main\Data\3den\LOP_ISTS_Infantry_B_Rifleman_2.jpg";
        price = 4000;
        amount = 7;
        stock = 10;
        code = "[_this select 2,['autorifleman','rifleman']] call uo_buyables_fnc_equipAIGroup";
    };
};
