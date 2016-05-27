#include "gui_base.hpp"

class mcd_RscMapText: RscText
{
	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	font = "PuristaLight";
	sizeEx = 0.04;
	colorBackground[] = { 0,0,0, 0.8 };
	text = "";
	w = 0.52 * 3/4;
	h = 0.05;
	duration = 1e+1000;
};

class mcd_RscMapTextSmall: RscText
{
	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	shadow = 2;
	font = "PuristaLight";
	sizeEx = 0.04;
	colorBackground[] = { 0,0,0, 0.8 };
	text = "";
	w = 0.52 * 3/4;
	h = 0.05;
	duration = 1e+1000;
};

class mcd_RscConfirmBar: RscText
{
	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	font = "PuristaLight";
	sizeEx = 0.03;
	colorBackground[] = {0,0,0,0.6};
	text = "";
	w = 0.52 * 3/4;
	h = 0.05;
	duration = 1e+1000;
};

class mcd_RscErrorTitle: mcd_RscMapText
{
	idc = -1;
	moving = 1;
	w = 1.0 * 3/4;
	h = 0.05;
	colorBackground[] = {0,0,0,0.8};
};

class mcd_RscErrorButton: RscButton
{
	idc = -1;
	style = ST_LEFT;
	shadow = 0;
	colorFocused[] = {1,1,1,0.5};
	colorBackgroundActive[] = {1,1,1,0.8}; // hover
	colorBackgroundDisabled[] = {0.3,0.3,0.3,1};
	colorBackgroundFocused[] = {0,0,0,0.5};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,1};
	font = "PuristaLight";
	sizeEx = 0.03;
	colorBackground[] = {0,0,0,0.6};
	w = 1.0 * 3/4;
	h = 0.05;
};
