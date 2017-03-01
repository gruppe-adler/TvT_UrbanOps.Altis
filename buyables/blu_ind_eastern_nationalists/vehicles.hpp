class Vehicles {
    displayName = "Vehicles";
    kindOf = "Vehicles";
    spawnEmpty = 1;

    class I_Quadbike_01_F {
        displayName = "Quadbike";
        description = "Seats: 2";
        price = 1000;
        stock = 10;
    };

    class rhsgref_nat_uaz {
        displayName = "Commandvehicle";
        description = "Seats: 7<br/><br/>Functions as a backup respawn and buymenu access position.";
        code = "if (isServer) then {[_this select 2] call uo_missionObjectives_fnc_setCommandVehicle};";
        price = 10000;
        stock = 2;
    };

    class rhsgref_nat_ural_work {
        displayName = "Ural-4320 (civilian)";
        description = "Seats: 15";
        price = 1200;
        stock = 10;
    };

    class rhsgref_nat_uaz_open {
        displayName = "UAZ (unarmed)";
        description = "Seats: 7";
        price = 1200;
        stock = 10;
    };

    class rhsgref_nat_uaz_dshkm {
        displayName = "UAZ (DShKM)";
        description = "Seats: 3";
        price = 3000;
        stock = 10;
    };

    class rhsgref_nat_uaz_spg9 {
        displayName = "UAZ (SPG-9)";
        description = "Seats: 3";
        price = 9000;
        stock = 10;
    };

    class Box_NATO_Equip_F {
        displayName = "Assault Boat (x2)";
        description = "2 assault boats in a box that can be loaded into vehicles.";
        code = "if (isServer) then {[_this select 2,'B_Boat_Transport_01_F',2] remoteExec ['uo_buyables_fnc_initBoatBox',0,true]}";
        price = 1500;
        stock = 10;
    };
};
