class grad_aicommand_commandwindow {
    idd = grad_aicommand_commandwindow_DIALOG;
    movingEnable = false;
    enableSimulation = true;

    onLoad = "missionNamespace setVariable ['grad_aicommand_commandwindow_isOpen',true];";
    onUnload = "missionNamespace setVariable ['grad_aicommand_commandwindow_isOpen',false]; [] call grad_aicommand_fnc_onUnload";

    class ControlsBackground {
        /*class TopBar: grad_aicommand_RscTopBar {

            x = safeZoneX;
            y = safeZoneY;
            w = safeZoneW;
            h = ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)*2;
        };*/
    };
    class Controls {
        /*class contextmenu: grad_aicommand_RscControlsGroupNoScrollbars {
            idc = grad_aicommand_contextmenu_GROUP;

        };*/
        /*class Map: grad_aicommand_RscMapControl {
            idc = grad_aicommand_commandwindow_MAP;

            x = safeZoneX;
            y = safeZoneY;
            w = safeZoneW;
            h = safeZoneH;
        };*/
    };
};
