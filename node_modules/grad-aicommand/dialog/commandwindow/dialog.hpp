class grad_aicommand_commandwindow {
    idd = GRAD_AICOMMAND_COMMANDWINDOW_DIALOG;
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
            idc = GRAD_AICOMMAND_CONTEXTMENU_GROUP;

        };*/
        /*class Map: grad_aicommand_RscMapControl {
            idc = GRAD_AICOMMAND_COMMANDWINDOW_MAP;

            x = safeZoneX;
            y = safeZoneY;
            w = safeZoneW;
            h = safeZoneH;
        };*/
    };
};
