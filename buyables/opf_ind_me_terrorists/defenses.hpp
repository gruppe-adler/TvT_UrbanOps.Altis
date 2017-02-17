class Defenses {
    displayName = "Defenses";
    kindOf = "Other";

    class rhs_Igla_AA_pod_msv {
        kindOf = "Vehicles";
        displayName = "Igla AA Pod";
        price = 1200;
        stock = 2;
    };

    class rhs_KORD_high_MSV {
        kindOf = "Vehicles";
        displayName = "KORD Static MG";
        price = 1500;
        stock = 4;
    };

    class RHS_NSV_TriPod_MSV {
        kindOf = "Vehicles";
        displayName = "NSV";
        price = 1500;
        stock = 4;
    };

    class Land_CncBarrier_F {
        displayName = "Concrete Barrier";
        price = 200;
        stock = 20;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };

    class Land_MetalBarrel_F {
        displayName = "Metal Barrel";
        price = 150;
        stock = 20;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };

    class Land_Tyre_F {
        displayName = "Tire";
        price = 50;
        stock = 60;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };

    class Land_Pallet_vertical_F {
        displayName = "Pallet";
        price = 150;
        stock = 20;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };

    class Land_IronPipes_F {
        displayName = "Iron Pipes";
        price = 350;
        stock = 20;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };

    class Land_CinderBlocks_01_F {
        displayName = "Cinder Blocks";
        price = 350;
        stock = 20;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };
};
