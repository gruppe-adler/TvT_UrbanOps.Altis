#include "defines.hpp"

class uo_showTimeLeft {
    idd = -1;
    fadein = 0;
    fadeout = 0;
    duration = 99999;

    enableSimulation = 1;
    enableDisplay = 1;

    class ControlsBackground {
        class Background: uo_RscStructuredText {
            idc = -1;

            onLoad = "uiNamespace setVariable ['uo_showTimeLeft', _this select 0];";
            onUnload = "uiNamespace setVariable ['uo_showTimeLeft', controlNull];";

            w = uo_showTimeLeft_W;
            h = uo_showTimeLeft_H;
            x = safeZoneX + (safeZoneW * 0.70);
            y = safeZoneY + (safeZoneH * 0.71);

            text = "";
        };
    };
};
