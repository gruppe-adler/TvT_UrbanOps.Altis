#include "defines.hpp"

class uo_RscConfirmHintTitle
{
	idc = -1;
	access = 0;
	type = CT_STATIC;
	style = ST_LEFT;
	font = "PuristaLight";
	sizeEx = 0.04 * TEXT_SCALE;
	moving = 1;
	colorText[] = {1, 1, 1, 1};
	text = "";
	fixedWidth = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	linespacing = 1;
	x = 0;
	y = 0;
	w = uo_ch_W;
	h = uo_ch_H;
	colorBackground[] = {0,0,0,0.8};
};

class uo_RscConfirmHintButton: uo_RscButton
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
	w = uo_ch_W;
	h = uo_ch_H;
};

class uo_confirmHint
{
	idd = uo_ch_DIALOG;
	movingenable = 1;

	enableSimulation = 1;
	enableDisplay = 1;
	objects[] = {};
	onLoad = "player say 'defaultNotification'";

	class ControlsBackground
	{
		class HintTitle: uo_RscConfirmHintTitle
		{
			moving = 1;
			idc = uo_ch_TITLE;
			x = uo_ch_X;
			y = uo_CH_Y;
			text = "";
		};
	};

	class Controls {
		class ConfirmButton: uo_RscConfirmHintButton
		{
			idc = uo_ch_BUTTON;
			text = "OK";
			x = uo_ch_X;
			y = uo_CH_Y + 1.1*uo_ch_H;
			action = "closeDialog 0";
		};
	};
};
