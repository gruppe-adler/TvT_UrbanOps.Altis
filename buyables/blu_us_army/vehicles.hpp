class Vehicles {
    displayName = "Vehicles";
    kindOf = "Vehicles";
    spawnEmpty = 1;

    class B_Quadbike_01_F {
        displayName = "Quadbike";
        description = "Seats: 2";
        price = 1000;
        stock = 10;
    };

    class rhsusf_m998_w_s_4dr_fulltop {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "Commandvehicle";
        description = "Seats: 4<br/><br/>Functions as a backup respawn and buymenu access position.";
        code = "if (isServer) then {[_this select 2] call uo_missionObjectives_fnc_setCommandVehicle};";
        price = 10000;
        stock = 2;
    };

    class rhsusf_m998_d_s_4dr_fulltop: rhsusf_m998_w_s_4dr_fulltop {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class rhsusf_m1025_w {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "HMMWV (unarmed)";
        description = "Seats: 4";
        price = 2000;
        stock = 10;
    };

    class rhsusf_m1025_d: rhsusf_m1025_w {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class rhsusf_m998_w_2dr_halftop {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "HMMWV (2D/Open)";
        description = "Seats: 8";
        price = 1800;
        stock = 10;
    };

    class rhsusf_m998_d_2dr_halftop: rhsusf_m998_w_2dr_halftop {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class rhsusf_m1025_w_m2 {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "HMMWV (M2)";
        description = "Seats: 5";
        price = 4000;
        stock = 10;
    };

    class rhsusf_m1025_d_m2: rhsusf_m1025_w_m2 {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class rhsusf_M1232_M2_usarmy_wd {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "M1232 (M2)";
        description = "Seats: 11";
        price = 8000;
        stock = 10;
    };

    class rhsusf_M1232_M2_usarmy_d: rhsusf_M1232_M2_usarmy_wd {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class rhsusf_m113_usarmy {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "M113 (M2)";
        description = "Seats: 13";
        price = 6000;
        stock = 10;
    };

    class rhsusf_m113d_usarmy: rhsusf_m113_usarmy {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class RHS_CH_47F_10 {
        displayName = "CH-47F";
        description = "Seats: 29";
        price = 20000;
        stock = 2;
    };

    class Box_NATO_Equip_F {
        displayName = "Assault Boat (x2)";
        description = "2 assault boats in a box that can be loaded into vehicles.";
        code = "if (isServer) then {[_this select 2,'B_Boat_Transport_01_F',2] remoteExec ['uo_buyables_fnc_initBoatBox',0,true]}";
        price = 1500;
        stock = 10;
    };
};
