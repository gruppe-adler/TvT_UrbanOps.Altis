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

    class rhs_SPG9M_MSV {
        kindOf = "Vehicles";
        displayName = "SPG-9M";
        price = 3000;
        stock = 1;
    };

    class Land_HBarrier_1_F {
        displayName = "H-Barrier (1)";
        price = 200;
        stock = 20;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };

    class Land_HBarrier_3_F {
        displayName = "H-Barrier (3)";
        price = 350;
        stock = 15;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };

    class Land_HBarrier_5_F {
        displayName = "H-Barrier (5)";
        price = 500;
        stock = 10;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };

    class Land_BagFence_Short_F {
        displayName = "Sandbags (short)";
        price = 200;
        stock = 20;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };

    class Land_BagFence_Long_F {
        displayName = "Sandbags (long)";
        price = 300;
        stock = 20;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };

    class Land_BagFence_Round_F{
        displayName = "Sandbags (round)";
        price = 300;
        stock = 20;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };

    class Land_Razorwire_F {
        displayName = "Razorwire";
        price = 150;
        stock = 20;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };

    class Land_Loudspeakers_F {
        displayName = "Propaganda Tower";
        description = "Broadcasts propaganda in regular intervals. Has to be switched on with ACE-Interaction. Generates the equivalent effect of four BLUFOR civilian kills over the course of the game. The farther from the center this is placed, the weaker the effect. The effects of multiple towers stack.";
        price = 1000;
        stock = 3;
        code = "if (player == _this select 0) then {[player,_this select 1] call grad_fortifications_fnc_addFort;}";
    };
};
