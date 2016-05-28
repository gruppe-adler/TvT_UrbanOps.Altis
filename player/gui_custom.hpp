#include "gui_base.hpp"

//SETUP DIALOGS ================================================================
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

//BUY MENU =====================================================================
class mcd_RscPicture
{
	shadow = 0;
	type = 0;
	style = 48;
	sizeEx = 0.023;
	font = "PuristaMedium";
	colorBackground[] = {};
	colorText[] = {};
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};

class mcd_RscButton
{
  access = 0;
	type = CT_BUTTON;
	text = "";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.1};
	colorBackground[] = {0,0,0,0.5};
	colorFocused[] = {1,1,1,0.5};
	colorBackgroundActive[] = {1,1,1,0.8}; // hover
	colorBackgroundDisabled[] = {0.3,0.3,0.3,1};
	colorBackgroundFocused[] = {0,0,0,0.5};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	style = 0;
	x = 0;
	y = 0;
	w = 0.055589;
	h = 0.039216;
	shadow = 0;
	font = "PuristaMedium";
	sizeEx = 0.04;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};

class mcd_RscCloseButton
{
  access = 0;
	type = CT_BUTTON;
	action = "closeDialog 0";
	text = "X";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",1};
	colorFocused[] = {1,1,1,0.5};
	colorBackgroundActive[] = {1,1,1,0.8}; // hover
	colorBackgroundDisabled[] = {0.3,0.3,0.3,1};
	colorBackgroundFocused[] = {1,1,1,0};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,1};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	style = 2;
	x = 0;
	y = 0;
	w = 0.055589;
	h = 0.039216;
	shadow = 0;
	font = "PuristaMedium";
	sizeEx = 0.04;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};
