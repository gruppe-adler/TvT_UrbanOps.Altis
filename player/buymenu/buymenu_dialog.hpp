#include "buymenu_defines.sqf"
#define bmButton_textSize (0.04 * TEXT_SCALE)

/*colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",1};*/

class buymenu
{
  idd = buymenu_DIALOG;
  movingEnable = true;
  enableSimulation = true;

  class ControlsBackground
  {
    /*#define bmBG_W (0.7333 * SZ_SCALE)
    #define bmBG_H (0.65 * SZ_SCALE)
    #define bmBG_X CENTER(1, bmBG_W)
    #define bmBG_Y CENTER(1, bmBG_H)*/

    #define bmItem_H (0.025 * Y_SCALE)
    #define bmItem_W (0.025 * X_SCALE)
    #define bmItemSpace_Y (0.0025 * SZ_SCALE)

    #define bmButton_W (0.1173 * SZ_SCALE)
    #define bmButton_H (0.0375 * Y_SCALE)
    #define bmBuyButton_H (bmButton_H * 1.25)

    #define bmPadding_Y (1 * bmItem_H)
    #define bmPadding_X (1 * bmItem_W)

    #define bmList_W (2 * bmButton_W)
    #define bmList_H ((6 * (bmButton_H + 0.75 * bmPadding_Y)) - 0.75*bmPadding_Y)
    /*#define bmList_H (0.3382 * SZ_SCALE)*/

    #define bmBG_W (bmPadding_X + bmButton_W + bmPadding_X + bmList_W + bmPadding_X + bmList_W + bmPadding_X)
    #define bmBG_H (bmPadding_Y + bmList_H + bmPadding_Y + bmBuyButton_H + bmPadding_Y)
    #define bmBG_X CENTER(1, bmBG_W)
    #define bmBG_Y CENTER(1, bmBG_H)

    #define bmCloseButton_W (bmItem_H - (2 * bmItemSpace_Y))
    #define bmTopBar_Y (bmBG_Y - bmItem_H * 1.1)

    class MainBackground: IGUIBack
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.6};


			x = bmBG_X;
			y = bmBG_Y;
			w = bmBG_W;
			h = bmBG_H;
		};

    class TopBar: IGUIBack
		{
			idc = -1;
			moving = true;
			/*colorBackground[] = {BUYMENU_COLOR_R, BUYMENU_COLOR_G, BUYMENU_COLOR_B, 0.8};*/
      colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",1};

			x = bmBG_X;
			y = bmTopBar_Y;
			w = bmBG_W;
			h = bmItem_H;
		};

    class DialogTitleText: w_RscText
    {
      idc = -1;
      text = "NAME OF VENDOR";
      sizeEx = 0.04 * TEXT_SCALE;

      x = bmBG_X;
			y = bmTopBar_Y;
			w = bmBG_W;
			h = bmItem_H;
    };

    class ItemSelectedPrice: w_RscStructuredTextLeft
    {
      idc = buymenu_item_TEXT;
      size = 0.04 * TEXT_SCALE;

      x = bmBG_X + (0.15 * SZ_SCALE);
      y = bmBG_Y + (0.514 * SZ_SCALE);
      w = 0.119 * SZ_SCALE;
      h = 0.0689 * SZ_SCALE;
    };
  };

  class Controls
  {
    class BuyButton: mcd_RscButton
    {
      idc = buymenu_buy;
      action = "[] call mcd_fnc_bmBuyCheck";
      text = "Buy";
      sizeEx = bmButton_textSize;
      style = 2;

      x = (bmBG_X + bmPadding_X + bmButton_W + bmPadding_X) + bmList_W + bmPadding_X + bmList_W - ((bmList_W - bmPadding_X) / 2);
      y = bmBG_Y + + bmPadding_Y + bmList_H + bmPadding_Y;
      w = (bmList_W - bmPadding_X) / 2;
      h = bmBuyButton_H;
    };

    class SelectionList: w_RscList
    {
      idc = buymenu_item_list;
      onLBSelChanged = "[] call mcd_fnc_bmGetDescription; [] call mcd_fnc_bmDisplayPicture";
      onload = "[0] call mcd_fnc_bmLoadCategory";
      sizeEx = 0.04 * TEXT_SCALE;
      rowHeight = 0.05 * TEXT_SCALE;

      x = bmBG_X + bmPadding_X + bmButton_W + bmPadding_X;
      y = bmBG_Y + bmPadding_Y;
      w = bmList_W;
      h = bmList_H;
    };

    class ItemPictureBG : IGUIBack
    {
      idc = buymenu_item_pictureBG;
      colorBackground[] = {0, 0, 0, 0.3};

      x = bmBG_X + bmPadding_X + bmButton_W + bmPadding_X + bmList_W + bmPadding_X;
      y = bmBG_Y + bmPadding_Y;
      w = bmList_W;
      h = (bmList_H - bmPadding_Y) / 2;
    };

    class ItemPicture: mcd_RscPicture
    {
    	idc = buymenu_item_picture;
    	style = 48 + 2048;
    	text = ""; //"a3\weapons_f\longrangerifles\ebr\data\UI\gear_ebr_ca.paa"; 2048
      x = bmBG_X + bmPadding_X + bmButton_W + bmPadding_X + bmList_W + bmPadding_X;
      y = bmBG_Y + bmPadding_Y + bmItemSpace_Y;
      w = bmList_W;
      h = ((bmList_H - bmPadding_Y) / 2) - 2*bmItemSpace_Y;
    };

    class ItemDescription: w_RscStructuredTextLeft
    {
      idc = buymenu_item_desc;
      size = 0.039 * TEXT_SCALE;
      colorBackground[] = {0, 0, 0, 0.3};

      x = bmBG_X + bmPadding_X + bmButton_W + bmPadding_X + bmList_W + bmPadding_X;
      y = bmBG_Y + bmPadding_Y + ((bmList_H - bmPadding_Y) / 2) + bmPadding_Y;
      w = bmList_W;
      h = (bmList_H - bmPadding_Y) / 2;
    };

    class RemainingFunds: w_RscStructuredTextLeft
    {
      idc = buymenu_money;
      size = 0.039 * TEXT_SCALE;
      text = "";
      colorBackground[] = {0,0,0,0.5};

      x = (bmBG_X + bmPadding_X + bmButton_W + bmPadding_X) + bmList_W + bmPadding_X + bmList_W - ((bmList_W - bmPadding_X) / 2) - bmPadding_X - ((bmList_W - bmPadding_X) / 2);
      y = bmBG_Y + + bmPadding_Y + bmList_H + bmPadding_Y;
      w = (bmList_W - bmPadding_X) / 2;
      h = bmBuyButton_H;
    };

    class CategoryButton0: mcd_RscButton
    {
      idc = buymenu_cat0;
      action = "[0] call mcd_fnc_bmLoadCategory";
      text = "Category 0";
      sizeEx = bmButton_textSize;

      x = bmBG_X + bmPadding_X;
      y = bmBG_Y + bmPadding_Y + (0 * (bmButton_H + 0.75 * bmPadding_Y));
      w = bmButton_W;
      h = bmButton_H;
    };

    class CategoryButton1: mcd_RscButton
    {
      idc = buymenu_cat1;
      action = "[1] call mcd_fnc_bmLoadCategory";
      text = "Category 1";
      sizeEx = bmButton_textSize;

      x = bmBG_X + bmPadding_X;
      y = bmBG_Y + bmPadding_Y + (1 * (bmButton_H + 0.75 * bmPadding_Y));
      w = bmButton_W;
      h = bmButton_H;
    };

    class CategoryButton2: mcd_RscButton
    {
      idc = buymenu_cat2;
      action = "[2] call mcd_fnc_bmLoadCategory";
      text = "Category 2";
      sizeEx = bmButton_textSize;

      x = bmBG_X + bmPadding_X;
      y = bmBG_Y + bmPadding_Y + (2 * (bmButton_H + 0.75 * bmPadding_Y));
      w = bmButton_W;
      h = bmButton_H;
    };

    class CategoryButton3: mcd_RscButton
    {
      idc = buymenu_cat3;
      action = "[3] call mcd_fnc_bmLoadCategory";
      text = "Category 3";
      sizeEx = bmButton_textSize;

      x = bmBG_X + bmPadding_X;
      y = bmBG_Y + bmPadding_Y + (3 * (bmButton_H + 0.75 * bmPadding_Y));
      w = bmButton_W;
      h = bmButton_H;
    };

    class CategoryButton4: mcd_RscButton
    {
      idc = buymenu_cat4;
      action = "[4] call mcd_fnc_bmLoadCategory";
      text = "Category 4";
      sizeEx = bmButton_textSize;

      x = bmBG_X + bmPadding_X;
      y = bmBG_Y + bmPadding_Y + (4 * (bmButton_H + 0.75 * bmPadding_Y));
      w = bmButton_W;
      h = bmButton_H;
    };

    class CategoryButton5: mcd_RscButton
    {
      idc = buymenu_cat5;
      action = "[5] call mcd_fnc_bmLoadCategory";
      text = "Category 5";
      sizeEx = bmButton_textSize;

      x = bmBG_X + bmPadding_X;
      y = bmBG_Y + bmPadding_Y + (5 * (bmButton_H + 0.75 * bmPadding_Y));
      w = bmButton_W;
      h = bmButton_H;
    };

    class CloseButton: mcd_RscCloseButton
    {
      idc = -1;
      x = bmBG_X + bmBG_W - bmItemSpace_Y - bmCloseButton_W;
      y = bmTopBar_Y + bmItemSpace_Y;
      w = bmCloseButton_W;
      h = bmCloseButton_W;
    };
  };
};
