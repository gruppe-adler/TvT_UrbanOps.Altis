class Vehicles {
    displayName = "Vehicles";
    kindOf = "Vehicles";
    spawnEmpty = 1;

    class O_Quadbike_01_F {
        displayName = "Quadbike";
        description = "Seats: 2";
        code = "_this call uo_buyables_fnc_initVehicleLock";
        price = 1000;
        stock = 10;
    };

    class rhs_tigr_m_msv {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "TIGR (unarmed)";
        description = "Seats: 8";
        code = "_this call uo_buyables_fnc_initVehicleLock";
        price = 2000;
        stock = 10;
    };

    class rhs_tigr_m_3camo_msv: rhs_tigr_m_msv {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class rhs_tigr_sts_msv {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "TIGR (PK)";
        description = "Seats: 7<br/><br/>No grenade launcher ammunition.";
        code = "if (isServer) then {for '_i' from 0 to 12 do {(_this select 2) removeMagazinesTurret ['RHS_mag_VOG30_30',[1]]}}; _this call uo_buyables_fnc_initVehicleLock";
        price = 4000;
        stock = 10;
    };

    class rhs_tigr_sts_3camo_msv: rhs_tigr_sts_msv {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class rhsgref_BRDM2_msv {
        displayName = "BRDM-2";
        description = "Seats: 5+6";
        code = "_this call uo_buyables_fnc_initVehicleLock";
        price = 6000;
        stock = 10;
    };

    class RHS_Ural_MSV_01 {
        displayName = "Ural-4320";
        description = "Seats: 15";
        code = "_this call uo_buyables_fnc_initVehicleLock";
        price = 1200;
        stock = 10;
    };
};
