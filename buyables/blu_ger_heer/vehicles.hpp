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

    class Fennek_Flecktarn_san {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "Commandvehicle";
        description = "Seats: 5<br/><br/>Functions as a backup respawn and buymenu access position.";
        code = "if (isServer) then {[_this select 2] call uo_missionObjectives_fnc_setCommandVehicle};";
        price = 10000;
        stock = 2;
    };

    class Fennek_Tropen_san: Fennek_Flecktarn_san {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class Fennek_Flecktarn {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "Fennek";
        description = "Seats: 5<br/><br/>No thermal imaging.";
        code = "if (isServer) then {[_this select 2] disableTIEquipment true};";
        price = 4000;
        stock = 10;
    };

    class Fennek_Tropen: Fennek_Flecktarn {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class B_Truck_01_transport_F {
        displayName = "Fennek";
        description = "Seats: 18<br/><br/>";
        price = 4000;
        stock = 10;
    };

    class CUP_B_Dingo_GER_Wdl {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "Dingo (MG3)";
        description = "Seats: 6<br/><br/>No thermal imaging.";
        code = "if (isServer) then {[_this select 2] disableTIEquipment true};";
        price = 8000;
        stock = 10;
    };

    class CUP_B_Dingo_GER_Des: CUP_B_Dingo_GER_Wdl {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class MH6_Flecktarn {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "MH6 Littlebird";
        description = "Seats: 8<br/><br/>";
        price = 1000;
        stock = 2;
    };

    class MH6_Tropentarn: MH6_Flecktarn {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class Box_NATO_Equip_F {
        displayName = "Assault Boat (x2)";
        description = "2 assault boats in a box that can be loaded into vehicles.";
        code = "if (isServer) then {[_this select 2,'B_Boat_Transport_01_F',2] remoteExec ['uo_buyables_fnc_initBoatBox',0,true]}";
        price = 1500;
        stock = 10;
    };
};
