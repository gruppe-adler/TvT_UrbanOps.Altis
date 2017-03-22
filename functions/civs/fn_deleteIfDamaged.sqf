/*  Deletes an object, if it has been damaged shortly after spawning.
*
*/

#define PREFIX uo
#define COMPONENT civs
#include "\x\cba\addons\main\script_macros_mission.hpp"


[{!isNull (_this select 0)}, {
    [{
        params ["_object"];
        if (damage _object > 0) then {
            INFO_1("%1 at %2 has been damaged during creation and had to be deleted :(",typeOf _object,getPos _object);
            deleteVehicle _object;
        };
    }, _this, 5] call CBA_fnc_waitAndExecute;
}, _this] call CBA_fnc_waitUntilAndExecute;
