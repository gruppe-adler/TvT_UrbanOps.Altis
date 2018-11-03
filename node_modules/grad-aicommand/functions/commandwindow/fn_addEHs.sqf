#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"
#include "script_component.hpp"

params ["_display","_mapCtrl"];

/* onMapSingleClick {[_pos,_shift,_alt] call grad_aicommand_fnc_onMapSingleClick}; */

grad_aicommand_keyUpEH = _display displayAddEventHandler ["KeyUp", {
    params ["_display","_DIK"];
    //close on M
    if (_DIK in (actionKeys "HideMap") && {!(missionNamespace getVariable [QGVAR(renameDialogIsOpen),false])}) then {
        closeDialog 0;
    };
}];

grad_aicommand_mouseButtonEH = _mapCtrl ctrlAddEventHandler ["MouseButtonUp", {
    params ["_control","_button"];

    switch (_button) do {

        // left click
        case (0): {_this call grad_aicommand_fnc_onLeftClick};

        // right click
        case (1): {_this call grad_aicommand_fnc_onRightClick};
    };

    false
}];
