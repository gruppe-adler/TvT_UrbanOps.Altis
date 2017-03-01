class Units {
    displayName = "Units";
    kindOf = "Units";

    class rhsgref_nat_militiaman_kar98k {
        displayName = "Militiaman";
        description = "A fighter armed with a Kar98K.";
        price = 500;
        stock = 10;
        code = "[_this select 2,'militiaman'] call uo_buyables_fnc_equipAIGroup";
    };

    class rhsgref_nat_hunter {
        displayName = "Marksman";
        description = "A marksman armed with an M76. High skill in aiming and spotting.";
        price = 1500;
        stock = 10;
        code = "[_this select 2,'marksman'] call uo_buyables_fnc_equipAIGroup";
    };

    class rhsgref_nat_grenadier_rpg {
        displayName = "Rifleman AT";
        description = "A rifleman armed with an AK and an RPG26.";
        price = 2000;
        stock = 10;
        code = "[_this select 2,'riflemanAT'] call uo_buyables_fnc_equipAIGroup";
    };

    class rhsgref_nat_machinegunner {
        displayName = "Machine Gunner";
        description = "A machine gunner armed with a PKM.";
        price = 2000;
        stock = 10;
        code = "[_this select 2,'machinegunner'] call uo_buyables_fnc_equipAIGroup";
    };

    class rhsgref_nat_rifleman_akms {
        displayName = "Rifleman Fireteam";
        description = "3 riflemen armed with AK variants.";
        price = 4000;
        amount = 3;
        stock = 10;
        code = "[_this select 2,'rifleman'] call uo_buyables_fnc_equipAIGroup";
    };
};
