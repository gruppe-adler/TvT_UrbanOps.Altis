waitUntil {!isNil "originalSide"};
bmMaxCategories = 6;


//ITEMS WEST ===================================================================
if (originalSide == "WEST") then {
  bmHighestCatID = 1;

  bmCategoryName0 = "Stuff";
  bmItemData0 = [
    ["Item 0", 5000, "Dies ist  Item 0", {hint "item0 category 0 gekauft!"}, "hgun_PDW2000_F"],
    ["Item 1", 7000, "Dies ist  Item 1", {hint "item1 category 0 gekauft!"}, "player\buymenu\pictures\test.paa"]
  ];

  bmCategoryName1 = "Things";
  bmItemData1 = [
    ["Item 10", 3000, "Dies ist  Item 10", {hint "item0 category 1 gekauft!"}, "U_B_CombatUniform_mcam"]
  ];

};

//ITEMS EAST ===================================================================
if (originalSide == "EAST") then {
  bmHighestCatID = 1;

  bmCategoryName0 = "Stuff";
  bmItemData0 = [
    ["Item 0", 5000, "Dies ist  Item 0", {hint "item0 category 0 gekauft!"}, "hgun_PDW2000_F"],
    ["Item 1", 7000, "Dies ist  Item 1", {hint "item1 category 0 gekauft!"}, "player\buymenu\pictures\test.paa"]
  ];

  bmCategoryName1 = "Things";
  bmItemData1 = [
    ["Item 10", 3000, "Dies ist  Item 10", {hint "item0 category 1 gekauft!"}, "player\buymenu\pictures\test.paa"]
  ];

};

diag_log format ["buymenu - itemconfig loaded for side %1.", originalSide];
