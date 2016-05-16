#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102

#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

#define GUI_GRID_X    (0)
#define GUI_GRID_Y    (0)
#define GUI_GRID_W    (0.025)
#define GUI_GRID_H    (0.04)
#define GUI_GRID_WAbs    (1)
#define GUI_GRID_HAbs    (1)


class RscStructuredText
{
    access = 0;
	idc = -1;
	type =  CT_STRUCTURED_TEXT; 
	style = ST_MULTI;
    lineSpacing = 0.5;
	colorBackground[] = {-1,-1,-1,0};
	colorText[] = {1,1,1,0.7};
	size = 0.038;
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0;
	w = 0;
    class Attributes {
        align = "center";      
  };
};

class RscStructuredTextTooltip
{
    access = 0;
    idc = -1;
    type =  CT_STRUCTURED_TEXT; 
    style = ST_MULTI;
    lineSpacing = 0.5;
    colorBackground[] = {-1,-1,-1,0};
    colorText[] = {1,1,1,0.7};
    size = 0.028;
    text = "";
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;
    class Attributes {
        align = "left";      
  };
};

class RscStructuredTextHeadline
{
    access = 0;
	idc = -1;
	type =  CT_STRUCTURED_TEXT; 
	style = ST_CENTER;
	colorBackground[] = {-1,-1,-1,0};
	colorText[] = {0.5,0.5,0.5,1};
	size = 0.048;
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0;
	w = 0;
	shadow = 0;
	font = "puristaMedium";
};


class RscText
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_MULTI;
    linespacing = 1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,0.5};
    text = "";
    shadow = 2;
    font = "PuristaLight";
    SizeEx = 0.02300;
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;
   
};

class RscPicture
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "PuristaLight";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
};

class RscButton
{
    
   access = 0;
    type = CT_BUTTON;
    text = "";
    colorText[] = {1,1,1,.9};
    colorDisabled[] = {0.4,0.4,0.4,1};
    colorBackground[] = {0.75,0.75,0.75,0.8};
    colorBackgroundDisabled[] = {0,0.0,0};
    colorBackgroundActive[] = {0.75,0.75,0.75,1};
    colorFocused[] ={0.75,0.75,0.75,0.8};
    colorShadow[] = {0.023529,0,0.0313725,1};
    colorBorder[] = {0.023529,0,0.0313725,1};
    soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
    soundPush[] = {"\ca\ui\data\sound\new1",0,0};
    soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
    soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 0;
    font = "PuristaMedium";
    sizeEx = 0.03921;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
	period = 0;
};

class RscButtonSmall
{
    
    access = 0;
    type = CT_BUTTON;
    text = "";
    colorText[] = {1,1,1,.9};
    colorDisabled[] = {0.4,0.4,0.4,1};
    colorBackground[] = {0.75,0.75,0.75,0.8};
    colorBackgroundDisabled[] = {0,0.0,0};
    colorBackgroundActive[] = {0.75,0.75,0.75,1};
    colorFocused[] = {0.75,0.75,0.75,0.8};
    colorShadow[] = {0.023529,0,0.0313725,1};
    colorBorder[] = {0.023529,0,0.0313725,1};
    soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
    soundPush[] = {"\ca\ui\data\sound\new1",0,0};
    soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
    soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    shadow = 0;
    font = "PuristaLight";
    size = 0.03921;
    sizeEx = 0.02921;
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};

class RscFrame
{
    type = CT_STATIC;
    idc = -1;
    style = ST_FRAME;
    shadow = 2;
    colorBackground[] = {1,1,1,1};
    colorText[] = {1,1,1,0.9};
    font = "PuristaLight";
    sizeEx = 0.03;
    text = "";
};

class background
{
   type = CT_STATIC;
    idc = -1;
    style = ST_LEFT;
    shadow = 2;
    colorText[] = {1,1,1,1};
    font = "PuristaLight";
    sizeEx = 0.04;
    colorBackground[] = { 0,0,0, 0.8 };
    text = "";

};

class mcdButton
{
    access = 0;
    idc = -1;
    type = CT_BUTTON;
    style = ST_LEFT;
    default = false;
    font = "PuristaLight";
    sizeEx = 0.03;
    colorText[] = {1,1,1,1};
    colorFocused[] = {0.75,0.75,0.75,0.8};
    colorDisabled[] = {0.4,0.4,0.4,1};
    colorBackground[] = {0,0,0,0.6};
    colorBackgroundDisabled[] = {0,0,0,0};
    colorBackgroundActive[] = {0.75,0.75,0.75,1};
    colorShadow[] = {0,0,0,0};
    colorBorder[] = { 0, 0, 0, 1 };
    borderSize = 0;
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
    soundPush[] = {"\ca\ui\data\sound\new1",0,0};
    soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
    soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
    x = 0;
    y = 0;
    w = 0.055589;
    h = 0.039216;
    text = "";
};
