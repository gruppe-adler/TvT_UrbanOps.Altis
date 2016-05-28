#include "moneymenu_defines.sqf"
#define mmButton_textSize (0.04 * TEXT_SCALE)

class moneymenu
{
  idd = moneymenu_DIALOG;
  movingEnable = true;
  enableSimulation = true;

  class ControlsBackground
  {
    #define mmItem_H (0.025 * Y_SCALE)
    #define mmItem_W (0.025 * X_SCALE)
    #define mmItemSpace_Y (0.0025 * SZ_SCALE)

    #define mmButton_W (0.1173 * SZ_SCALE)
    #define mmButton_H (0.0375 * Y_SCALE)

    #define mmPadding_Y (1 * mmItem_H)
    #define mmPadding_X (1 * mmItem_W)

    #define mmCloseButton_W (mmItem_H - (2 * mmItemSpace_Y))
    #define mmTopBar_Y (mmBG_Y - mmItem_H * 1.1)
    #define mmInfo_W (0.3 * X_SCALE)
    #define mmInput_W (0.1 * X_SCALE)

    #define mmBG_W (mmPadding_X + mmInfo_W + mmPadding_X)
    #define mmBG_H (mmPadding_Y + mmItem_H + mmPadding_Y + mmItem_H + mmPadding_Y + mmButton_H + mmPadding_Y)
    #define mmBG_X CENTER(1, mmBG_W)
    #define mmBG_Y CENTER(1, mmBG_H)

    class MainBackground: IGUIBack
    {
      idc = -1;

      colorBackground[] = {0,0,0,0.6};
      x = mmBG_X;
      y = mmBG_Y;
      w = mmBG_W;
      h = mmBG_H;
    };

    class TopBar: IGUIBack
    {
      idc = -1;
      moving = true;

      x = mmBG_X;
      y = mmTopBar_Y;
      w = mmBG_W;
      h = mmItem_H;
      colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",1};
    };

    class DialogTitleText: w_RscText
    {
      idc = moneymenu_title;
      text = "GIVE MONEY TO (NAME)";
      sizeEx = 0.04 * TEXT_SCALE;

      x = mmBG_X;
      y = mmTopBar_Y;
      w = mmBG_W;
      h = mmItem_H;
    };

    /*class MyFundsBG: RscText
    {
      idc = -1;
      colorBackground[] = {0,0,0,0.5};
      x = mmBG_X + mmPadding_X;
      y = mmBG_Y + mmPadding_X;
      w = mmInfo_W;
      h = mmItem_H;
    };*/

    class MyFundsAmount: RscStructuredTextRight
    {
      idc = moneymenu_myfunds;
      text = "0 Cr";
      sizeEx = 0.04 * TEXT_SCALE;
      colorBackground[] = {0,0,0,0};
      x = mmBG_X + mmPadding_X;
      y = mmBG_Y + mmPadding_Y;
      w = mmInfo_W;
      h = mmItem_H;
    };

    class MyFundsText: RscStructuredText
    {
      idc = -1;
      text = "My Funds:";
      sizeEx = 0.04 * TEXT_SCALE;
      colorBackground[] = {0,0,0,0.5};
      x = mmBG_X + mmPadding_X;
      y = mmBG_Y + mmPadding_Y;
      w = mmInfo_W;
      h = mmItem_H;
    };

    class GiveBG: RscStructuredText
    {
      idc = -1;
      text = "Amount:";
      sizeEx = 0.04 * TEXT_SCALE;
      colorBackground[] = {0,0,0,0.5};
      x = mmBG_X + mmPadding_X;
      y = mmBG_Y + mmPadding_Y + mmItem_H + mmPadding_Y;
      w = mmInfo_W;
      h = mmItem_H;
    };

    class GiveTextRight: RscStructuredTextRight
    {
      idc = -1;
      text = "Cr";
      sizeEx = 0.04 * TEXT_SCALE;
      colorBackground[] = {0,0,0,0};
      x = mmBG_X + mmPadding_X;
      y = mmBG_Y + mmPadding_Y + mmItem_H + mmPadding_Y;
      w = mmInfo_W;
      h = mmItem_H;
    };
  };

  class Controls
  {
    class CloseButton: mcd_RscCloseButton
    {
      idc = -1;
      x = mmBG_X + mmBG_W - mmItemSpace_Y - mmCloseButton_W;
      y = mmTopBar_Y + mmItemSpace_Y;
      w = mmCloseButton_W;
      h = mmCloseButton_W;
    };

    class InputBox: RscEdit
    {
      idc = moneymenu_input;
      text = "0";
      style = ST_RIGHT + ST_FRAME;
      x = mmBG_X + mmInfo_W - (mmPadding_X/4) - mmInput_W;
      y = mmBG_Y + mmPadding_Y + mmItem_H + mmPadding_Y;
      w = mmInput_W;
      h = mmItem_H;
    };

    class OKButton: mcd_RscButton
    {
      idc = moneymenu_okbutton;
      action = "[] call mcd_fnc_mmCheckSendMoney";
      text = "OK";
      sizeEx = mmButton_textSize;
      style = 2;

      x = mmBG_X + mmPadding_X + mmInfo_W - mmButton_W;
      y = mmBG_Y + mmPadding_Y + mmItem_H + mmPadding_Y + mmItem_H + mmPadding_Y;
      w = mmButton_W;
      h = mmButton_H;
    };
  };
};
