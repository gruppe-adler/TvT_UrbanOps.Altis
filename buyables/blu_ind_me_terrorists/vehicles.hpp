class Vehicles {
    displayName = "Vehicles";
    kindOf = "Vehicles";
    spawnEmpty = 1;

    class LOP_ISTS_Landrover {
        displayName = "Commandvehicle";
        description = "Seats: 7<br/><br/>Functions as a backup respawn and buymenu access position.";
        code = "if (isServer) then {[_this select 2] call uo_missionObjectives_fnc_setCommandVehicle};";
        price = 10000;
        stock = 2;
    };

    class LOP_ISTS_OPF_Landrover_M2 {
        displayName = "Land Rover (M2)";
        description = "Seats: 3";
        price = 4000;
        stock = 10;
    };

    class LOP_ISTS_OPF_M998_D_4DR {
        displayName = "HMMWV (2D/Open)";
        description = "Seats: 8";
        price = 1800;
        stock = 10;
    };

    class LOP_ISTS_OPF_M1025_D {
        displayName = "HMMWV (unarmed)";
        description = "Seats: 4";
        price = 2000;
        stock = 10;
    };

    class Box_NATO_Equip_F {
        displayName = "Assault Boat (x2)";
        description = "2 assault boats in a box that can be loaded into vehicles.";
        code = "if (isServer) then {[_this select 2,'B_Boat_Transport_01_F',2] remoteExec ['uo_buyables_fnc_initBoatBox',0,true]}";
        price = 2500;
        stock = 10;
    };
};
