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

    class Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "Commandvehicle";
        description = "Seats: 4<br/><br/>Functions as a backup respawn and buymenu access position.";
        code = "if (isServer) then {[_this select 2] call uo_missionObjectives_fnc_setCommandVehicle}; _this call uo_buyables_fnc_initVehicleLock";
        price = 10000;
        stock = 2;
    };

    class Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu: Redd_Tank_LKW_leicht_gl_Wolf_Flecktarn_FueFu {
        condition = "!uo_missionParam_ISWOODLAND";
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

    class MH6_Flecktarn {
        condition = "uo_missionParam_ISWOODLAND";
        displayName = "MH6 Littlebird";
        description = "Seats: 8<br/><br/>";
        code = "_this call uo_buyables_fnc_initVehicleLock";
        price = 10000;
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
