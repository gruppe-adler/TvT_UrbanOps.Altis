#include "defines.hpp"

class uo_animatedHint {
    idd = uo_animatedHint_TITLE;
    duration = 99999;

    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['uo_animatedHint', _this select 0];";
    onUnload = "uiNamespace setVariable ['uo_animatedHint', displayNull];";

    class ControlsBackground {
        class Background: uo_RscText {
            idc = uo_animatedHint_BACKGROUND;

            w = uo_animatedHint_W;
            h = uo_animatedHint_H;
            x = uo_animatedHint_X;
            y = uo_animatedHint_Y;

            colorBackground[] = {0,0,0,0.65};
        };

        class Picture: uo_RscPicture {
            idc = uo_animatedHint_PICTURE;

            w = uo_animatedHint_picture_W;
            h = uo_animatedHint_H;
            x = uo_animatedHint_X;
            y = uo_animatedHint_Y;

            text = "";
        };

        class Text: uo_RscText {
            idc = uo_animatedHint_TEXT;

            w = uo_animatedHint_W - uo_animatedHint_picture_W;
            h = uo_animatedHint_H;
            x = uo_animatedHint_X + uo_animatedHint_picture_W;
            y = uo_animatedHint_Y;

            text = "";
        };
    };
};
