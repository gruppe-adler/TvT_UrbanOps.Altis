class Vehicles {
    displayName = "Vehicles";
    kindOf = "Vehicles";
    spawnEmpty = 1;

    class B_Quadbike_01_F {
        displayName = "Quadbike";
        description = "Seats: 2";
        code = "_this call uo_buyables_fnc_initVehicleLock";
        price = 1000;
        stock = 10;
    };

    class Fennek_Flecktarn {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "Fennek";
        description = "Seats: 5<br/><br/>No thermal imaging.";
        code = "if (isServer) then {(_this select 2) disableTIEquipment true}; _this call uo_buyables_fnc_initVehicleLock";
        price = 4000;
        stock = 10;
    };

    class Fennek_Tropen: Fennek_Flecktarn {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class B_Truck_01_transport_F {
        displayName = "HEMTT Transport";
        description = "Seats: 18<br/><br/>";
        code = "_this call uo_buyables_fnc_initVehicleLock";
        price = 4000;
        stock = 10;
    };

    class Redd_Tank_Fuchs_1A4_Jg_Flecktarn {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "Fuchs Infantry (MG3)";
        description = "Seats: 11";
        code = "if (isServer) then {(_this select 2) disableTIEquipment true}; _this call uo_buyables_fnc_initVehicleLock";
        price = 8000;
        stock = 10;
    };

    class Redd_Tank_Fuchs_1A4_Jg_Tropentarn: Redd_Tank_Fuchs_1A4_Jg_Flecktarn {
        condition = "!uo_missionParam_ISWOODLAND";
    };
};
