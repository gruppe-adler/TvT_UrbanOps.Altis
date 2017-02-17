class Units {
    displayName = "Units";
    kindOf = "Units";

    class O_soldier_M_F {
        displayName = "Marksman";
        picture = "\po_main\Data\3den\LOP_ISTS_Infantry_B_Rifleman_2.jpg";
        price = 200;
        stock = 10;
        code = "[_this select 2,'marksman'] call uo_buyables_fnc_equipAIGroup";
    };
};
