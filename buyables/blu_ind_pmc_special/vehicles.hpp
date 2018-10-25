class Vehicles {
    displayName = "Vehicles";
    kindOf = "Vehicles";
    spawnEmpty = 1;

    class I_G_Quadbike_01_F {
        displayName = "Quadbike";
        description = "Seats: 2";
        code = "_this call uo_buyables_fnc_initVehicleLock";
        price = 1000;
        stock = 10;
    };

    class CUP_C_SUV_TK {
        displayName = "SUV (unarmed)";
        description = "Seats: 7+6";
        code = "_this call uo_buyables_fnc_initVehicleLock";
        price = 1800;
        stock = 10;
    };

    class rhsusf_M1078A1R_SOV_M2_D_fmtv_socom {
        description = "Seats: 5";
        code = "_this call uo_buyables_fnc_initVehicleLock";
        price = 4000;
        stock = 10;
    };

    class RHS_MELB_MH6M {
        displayName = "MH6M";
        description = "Seats: 2+6";
        code = "if (isServer) then {(_this select 2) disableTIEquipment true}; _this call uo_buyables_fnc_initVehicleLock";
        price = 11000;
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
