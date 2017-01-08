class Vehicles {
    permissionLevel = 3;

    displayName = "Vehicles";
    kindOf = "Vehicles";
    spawnEmpty = 1;

    class B_Quadbike_01_F {
        permissionLevel = 0;

        displayName = "Quadbike";
        price = 1000;
        stock = 10;
    };

    class rhsusf_m998_w_s_4dr_fulltop {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "Commandvehicle";
        description = "Functions as a backup respawn and buymenu access position.";
        price = 10000;
        stock = 1;

        code = "[_this select 2] call uo_fnc_setCommandVehicle;";
    };

    class rhsusf_m998_d_s_4dr_fulltop {
        condition = "!uo_missionParam_ISWOODLAND";
        displayName = "Commandvehicle";
        description = "Functions as a backup respawn and buymenu access position.";
        price = 10000;
        stock = 1;

        code = "[_this select 2] call uo_fnc_setCommandVehicle;";
    };

    class rhsusf_m1025_w {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "HMMWV (unarmed)";
        price = 2000;
        stock = 10;
    };

    class rhsusf_m1025_d {
        condition = "!uo_missionParam_ISWOODLAND";
        displayName = "HMMWV (unarmed)";
        price = 2000;
        stock = 10;
    };

    class rhsusf_m998_w_2dr_halftop {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "HMMWV (2D/Open)";
        price = 1800;
        stock = 10;
    };

    class rhsusf_m998_d_2dr_halftop {
        condition = "!uo_missionParam_ISWOODLAND";
        displayName = "HMMWV (2D/Open)";
        price = 1800;
        stock = 10;
    };

    class rhsusf_m1025_w_m2 {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "HMMWV (M2)";
        price = 4000;
        stock = 10;
    };

    class rhsusf_m1025_d_m2 {
        condition = "!uo_missionParam_ISWOODLAND";
        displayName = "HMMWV (M2)";
        price = 4000;
        stock = 10;
    };

    class rhsusf_m113_usarmy {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "M113 (M2)";
        price = 6000;
        stock = 10;
    };

    class rhsusf_m113d_usarmy {
        condition = "!uo_missionParam_ISWOODLAND";
        displayName = "M113 (M2)";
        price = 6000;
        stock = 10;
    };

    class RHS_CH_47F_10 {
        displayName = "CH-47F";
        price = 20000;
        stock = 2;
    };
};
