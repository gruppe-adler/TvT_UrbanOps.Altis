class Vehicles {
    permissionLevel = 3;

    displayName = "Vehicles";
    kindOf = "Vehicles";
    spawnEmpty = 1;

    class O_Quadbike_01_F {
        permissionLevel = 0;

        displayName = "Quadbike";
        price = 1000;
        stock = 10;
    };

    class rhs_tigr_m_msv {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "TIGR (unarmed)";
        price = 2000;
        stock = 10;
    };

    class rhs_tigr_m_3camo_msv {
        condition = "!uo_missionParam_ISWOODLAND";
        displayName = "TIGR (unarmed)";
        price = 2000;
        stock = 10;
    };

    class rhs_tigr_sts_msv {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "TIGR (PK)";
        price = 4000;
        stock = 10;
        code = "if (isServer) then {for '_i' from 0 to 12 do {(_this select 2) removeMagazinesTurret ['RHS_mag_VOG30_30',[1]]}}";
    };

    class rhs_tigr_sts_3camo_msv {
        condition = "!uo_missionParam_ISWOODLAND";
        displayName = "TIGR (PK)";
        price = 4000;
        stock = 10;
        code = "if (isServer) then {for '_i' from 0 to 12 do {(_this select 2) removeMagazinesTurret ['RHS_mag_VOG30_30',[1]]}}";
    };

    class rhsgref_BRDM2_msv {
        displayName = "BRDM-2";
        price = 6000;
        stock = 10;
    };

    class RHS_Ural_MSV_01 {
        displayName = "Ural-4320";
        price = 1200;
        stock = 10;
    };
};
