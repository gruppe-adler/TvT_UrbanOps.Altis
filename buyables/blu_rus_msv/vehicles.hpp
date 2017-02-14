class Vehicles {
    displayName = "Vehicles";
    kindOf = "Vehicles";
    spawnEmpty = 1;

    class O_Quadbike_01_F {
        displayName = "Quadbike";
        description = "Seats: 2";
        price = 1000;
        stock = 10;
    };

    class rhs_tigr_msv {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "Commandvehicle";
        description = "Seats: 9<br/><br/>Functions as a backup respawn and buymenu access position.";
        code = "if (isServer) then {[_this select 2] call uo_missionObjectives_fnc_setCommandVehicle};";
        price = 10000;
        stock = 2;
    };

    class rhs_tigr_3camo_msv: rhs_tigr_msv {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class rhs_tigr_m_msv {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "TIGR (unarmed)";
        description = "Seats: 8";
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
        code = "if (isServer) then {for '_i' from 0 to 12 do {(_this select 2) removeMagazinesTurret ['RHS_mag_VOG30_30',[1]]}}";
        price = 4000;
        stock = 10;
    };

    class rhs_tigr_sts_3camo_msv: rhs_tigr_sts_msv {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class rhsgref_BRDM2_msv {
        displayName = "BRDM-2";
        description = "Seats: 5+6";
        price = 6000;
        stock = 10;
    };

    class RHS_Ural_MSV_01 {
        displayName = "Ural-4320";
        description = "Seats: 15";
        price = 1200;
        stock = 10;
    };
};
