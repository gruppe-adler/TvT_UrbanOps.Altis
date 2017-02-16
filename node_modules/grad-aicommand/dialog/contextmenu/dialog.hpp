class grad_aicommand_contextmenu {
    idd = grad_aicommand_contextmenu_DIALOG;
    movingEnable = true;
    enableSimulation = true;

    onLoad = "missionNamespace setVariable ['grad_aicommand_contextmenu_isOpen',true]";
    onUnload = "missionNamespace setVariable ['grad_aicommand_contextmenu_isOpen',false]";
    onMouseButtonDown = "_this call grad_aicommand_fnc_catchMouseClick";

    class ControlsBackground {};
    class Controls {};
};
