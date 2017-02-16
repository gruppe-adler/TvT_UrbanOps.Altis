#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\commandwindow\defines.hpp"

onMapSingleClick "";
(findDisplay grad_aicommand_commandwindow_DIALOG) displayRemoveEventHandler ["MouseButtonUp",grad_aicommand_mouseButtonEH];
(findDisplay grad_aicommand_commandwindow_DIALOG) displayRemoveEventHandler ["KeyUp",grad_aicommand_keyUpEH];


/*["grad_aicommand_mapClickEH","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;*/
