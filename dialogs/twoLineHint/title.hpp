#include "defines.hpp"

class uo_tlh_line {
	access = 0;
	type = CT_STATIC;
    style = ST_LEFT;
	idc = -1;
	colorBackground[] = { 0,0,0, 0.8 };
	colorText[] = {1, 1, 1, 1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
    w = uo_tlh_W;
	h = uo_tlh_H;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	font = "PuristaLight";
	sizeEx = 0.04 * TEXT_SCALE;
	linespacing = 1;
    duration = 1e+1000;
};

class uo_twoLineHint
{
	idd = uo_tlh_TITLE;
	duration = 99999;

	enableSimulation = 1;
	enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['uo_twoLineHint', _this select 0];";
    onUnload = "uiNamespace setVariable ['uo_twoLineHint', displayNull];";

	class ControlsBackground
	{
		class line1: uo_tlh_line
		{
			idc = uo_tlh_LINE1;
            moving = 1;
			text = "";
			x = uo_tlh_X;
			y = uo_tlh_Y;
		};

        class line2: uo_tlh_line
        {
            idc = uo_tlh_LINE2;
            text = "";
            x = uo_tlh_X;
            y = uo_tlh_Y + uo_tlh_H * 1.1;
        };
	};
};
