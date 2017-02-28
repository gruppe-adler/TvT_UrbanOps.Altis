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
};
