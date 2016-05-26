mcd_fnc_bmPopulateItemList = compile preprocessFileLineNumbers "player\buymenu\fn_bmPopulateItemList.sqf";
mcd_fnc_bmGetDescription = compile preprocessFileLineNumbers "player\buymenu\fn_bmGetDescription.sqf";
mcd_fnc_bmBuy = compile preprocessFileLineNumbers "player\buymenu\fn_bmBuy.sqf";
mcd_fnc_bmUpdateMoney = compile preprocessFileLineNumbers "player\buymenu\fn_bmUpdateMoney.sqf";
mcd_fnc_bmDisplayPicture = compile preprocessFileLineNumbers "player\buymenu\fn_bmDisplayPicture.sqf";

[] spawn (compile preprocessFileLineNumbers "player\buymenu\itemConfig.sqf");


playerMoney = 20000;
