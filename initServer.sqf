//DEBUGDEBUGDEBUGDEBUGDEBUGDEBUG
CHOSENLOCATION = nearestLocation [[13991.4,18699.7,0], "NameCity"];
CITYCHOSEN = true;



["Initialize", [true]] call BIS_fnc_dynamicGroups;

[] execVM "tfarsettings.sqf";




/*
//Setup ======================================================================
[] execVM "server\buymenu\bm_itemConfig.sqf";
[] execVM "server\setup\createCivilians.sqf";

//Main =======================================================================
[] execVM "server\endByControl.sqf";
[] execVM "server\endByTimeout.sqf";
[] execVM "server\endByBluKilled.sqf";
[] execVM "server\endByOpfKilled.sqf";
