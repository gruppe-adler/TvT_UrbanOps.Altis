class Items {
    displayName = "Items";
    kindOf = "Items";

    class NVGoggles {
        displayName = "Night Vision Googles (Gen. 3)";
        price = 1000;
        stock = 40;
    };

    class lerca_1200_black {
        displayName = "Lerca 1200 Rangefinder";
        price = 800;
        stock = 2;
    };

    class ACE_VectorDay {
        displayName = "Vector Rangefinder";
        price = 1000;
        stock = 2;
    };

    class ACE_Vector {
        displayName = "Vector Rangefinder (Night)";
        price = 1500;
        stock = 2;
    };

    class ACE_RangeCard {
        displayName = "Range Card";
        price = 100;
        stock = 20;
    };

    class ACE_Clacker {
        displayName = "M57 Firing Device";
        price = 100;
        stock = 10;
    };

    class ACE_DefusalKit {
        displayName = "Defusal Kit";
        price = 300;
        stock = 20;
    };

    class ARC_GER_Backpack_compact_Flecktarn {
        kindOf = "Wearables";
        condition = "uo_missionParam_ISWOODLAND";

        displayName = "Compact Backpack";
        price = 100;
        stock = 20;
    };

    class ARC_GER_Backpack_compact_Tropentarn: ARC_GER_Backpack_compact_Flecktarn {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class ARC_GER_Kitbag_compact_Flecktarn {
        kindOf = "Wearables";
        condition = "uo_missionParam_ISWOODLAND";

        displayName = "Kitbag Backpack";
        price = 300;
        stock = 20;
    };

    class ARC_GER_Kitbag_compact_Tropentarn: ARC_GER_Kitbag_compact_Flecktarn {
        condition = "!uo_missionParam_ISWOODLAND";
    };

    class tf_rt1523g_big_bwmod {
        kindOf = "Wearables";
        condition = "uo_missionParam_ISWOODLAND";

        displayName = "RT-1523G Manpack";
        price = 1000;
        stock = 6;
    };

    class tf_rt1523g_big_bwmod_tropen: tf_rt1523g_big_bwmod {
        condition = "!uo_missionParam_ISWOODLAND";
    };
};
