class RscTitles
{
  class previewWeather
  {
    idd = -1;
    duration = 1e+011;

    enableSimulation = 1;
    enableDisplay = 1;
    objects[] = {};
    onLoad = "uinamespace setvariable ['previewWeather',_this select 0];";
    onUnload = "uinamespace setvariable ['previewWeather',nil];";

    class ControlsBackground
    {
      class Display
      {
        idc = 1600;
        type = 0;
        style = 48;
        access = 0;
        colorBackground[] = {0,0,0,0};
        colorText[] = {1,1,1,1};
        fixedWidth = 0;
        font = "Zeppelin32";
        tooltipColorBox[] = {1,1,1,1};
        tooltipColorShade[] = {0,0,0,0.65};
        tooltipColorText[] = {1,1,1,1};
        SizeEx = 0;
        shadow = 0;
        lineSpacing = 0;
        text = "";

        x = "(safezoneX + safezoneW - 6.8 * (		((safezoneW / safezoneH) min 1.2) / 32)) + (	0.5 * 	0.67 * 			(		((safezoneW / safezoneH) min 1.2) / 32))";
        y = "(7 * (		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 			(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))) + (	0.5 * 	0.67 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20))";
        h = "(				(6 * 						(		((safezoneW / safezoneH) min 1.2) / 32))) - (2 * 	0.5 * 	0.67 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20))";
        w = "(6 * 						(		((safezoneW / safezoneH) min 1.2) / 32)) - (2 * 	0.5 * 	0.67 * 			(		((safezoneW / safezoneH) min 1.2) / 32))";
      };
    };

    class Controls
    {
      class B
      {
        idc = -1;
        type = 0;
        style = 48;
        shadow = 0;
        access = 0;
        colorBackground[] = {0,0,0,0};
        colorText[] = {1,1,1,1};
        fixedWidth = 0;
        SizeEx = 0;
        tooltipColorBox[] = {1,1,1,1};
        tooltipColorShade[] = {0,0,0,0.65};
        tooltipColorText[] = {1,1,1,1};
        font = "Zeppelin32";

        text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_B_ca.paa";
        h = "0.5 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
        w = "(6 * 						(		((safezoneW / safezoneH) min 1.2) / 32)) - (2 * 	0.5 * 			(		((safezoneW / safezoneH) min 1.2) / 32))";
        x = "(safezoneX + safezoneW - 6.8 * 						(		((safezoneW / safezoneH) min 1.2) / 32)) + (	0.5 * 			(		((safezoneW / safezoneH) min 1.2) / 32))";
        y = "(7 * 						(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 			(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))) + 		(				(6 * 						(		((safezoneW / safezoneH) min 1.2) / 32))) - (	0.5 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20))";
      };

      class BL
      {
        idc = -1;
        type = 0;
        style = 48;
        shadow = 0;
        access = 0;
        colorBackground[] = {0,0,0,0};
        colorText[] = {1,1,1,1};
        fixedWidth = 0;
        SizeEx = 0;
        tooltipColorBox[] = {1,1,1,1};
        tooltipColorShade[] = {0,0,0,0.65};
        tooltipColorText[] = {1,1,1,1};
        font = "Zeppelin32";

        text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_BL_ca.paa";
        h = "0.5 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
        w = "0.5 * 			(		((safezoneW / safezoneH) min 1.2) / 32)";
        x = "(safezoneX + safezoneW - 6.8 * 						(		((safezoneW / safezoneH) min 1.2) / 32))";
        y = "(7 * 						(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 			(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))) + 		(				(6 * 						(		((safezoneW / safezoneH) min 1.2) / 32))) - (	0.5 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20))";
      };

      class BR
      {
        idc = -1;
        type = 0;
        style = 48;
        shadow = 0;
        access = 0;
        colorBackground[] = {0,0,0,0};
        colorText[] = {1,1,1,1};
        fixedWidth = 0;
        SizeEx = 0;
        tooltipColorBox[] = {1,1,1,1};
        tooltipColorShade[] = {0,0,0,0.65};
        tooltipColorText[] = {1,1,1,1};
        font = "Zeppelin32";

        text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_BR_ca.paa";
        h = "0.5 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
        w = "0.5 * 			(		((safezoneW / safezoneH) min 1.2) / 32)";
        x = "(safezoneX + safezoneW - 6.8 * 						(		((safezoneW / safezoneH) min 1.2) / 32)) + 				(6 * 						(		((safezoneW / safezoneH) min 1.2) / 32)) - (	0.5 * 			(		((safezoneW / safezoneH) min 1.2) / 32))";
        y = "(7 * 						(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 			(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))) + 		(				(6 * 						(		((safezoneW / safezoneH) min 1.2) / 32))) - (	0.5 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20))";
      };

      class L
      {
        idc = -1;
        type = 0;
        style = 48;
        shadow = 0;
        access = 0;
        colorBackground[] = {0,0,0,0};
        colorText[] = {1,1,1,1};
        fixedWidth = 0;
        SizeEx = 0;
        tooltipColorBox[] = {1,1,1,1};
        tooltipColorShade[] = {0,0,0,0.65};
        tooltipColorText[] = {1,1,1,1};
        font = "Zeppelin32";

        text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_L_ca.paa";
        h = "(				(6 * 						(		((safezoneW / safezoneH) min 1.2) / 32))) - (2 * 	0.5 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20))";
        w = "0.5 * 			(		((safezoneW / safezoneH) min 1.2) / 32)";
        x = "(safezoneX + safezoneW - 6.8 * 						(		((safezoneW / safezoneH) min 1.2) / 32))";
        y = "(7 * 						(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 			(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))) + (	0.5 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20))";
      };

      class R
      {
        idc = -1;
        type = 0;
        style = 48;
        shadow = 0;
        access = 0;
        colorBackground[] = {0,0,0,0};
        colorText[] = {1,1,1,1};
        fixedWidth = 0;
        SizeEx = 0;
        tooltipColorBox[] = {1,1,1,1};
        tooltipColorShade[] = {0,0,0,0.65};
        tooltipColorText[] = {1,1,1,1};
        font = "Zeppelin32";

        text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_R_ca.paa";
        h = "(				(6 * 						(		((safezoneW / safezoneH) min 1.2) / 32))) - (2 * 	0.5 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20))";
        w = "0.5 * 			(		((safezoneW / safezoneH) min 1.2) / 32)";
        x = "(safezoneX + safezoneW - 6.8 * 						(		((safezoneW / safezoneH) min 1.2) / 32)) + 				(6 * 						(		((safezoneW / safezoneH) min 1.2) / 32)) - (	0.5 * 			(		((safezoneW / safezoneH) min 1.2) / 32))";
        y = "(7 * 						(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 			(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2))) + (	0.5 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20))";
      };

      class T
      {
        idc = -1;
        type = 0;
        style = 48;
        shadow = 0;
        access = 0;
        colorBackground[] = {0,0,0,0};
        colorText[] = {1,1,1,1};
        fixedWidth = 0;
        SizeEx = 0;
        tooltipColorBox[] = {1,1,1,1};
        tooltipColorShade[] = {0,0,0,0.65};
        tooltipColorText[] = {1,1,1,1};
        font = "Zeppelin32";

        text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_T_ca.paa";
        h = "0.5 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
        w = "(6 * 						(		((safezoneW / safezoneH) min 1.2) / 32)) - (2 * 	0.5 * 			(		((safezoneW / safezoneH) min 1.2) / 32))";
        x = "(safezoneX + safezoneW - 6.8 * 						(		((safezoneW / safezoneH) min 1.2) / 32)) + (	0.5 * 			(		((safezoneW / safezoneH) min 1.2) / 32))";
        y = "(7 * 						(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 			(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2)))";
      };

      class TL
      {
        idc = -1;
        type = 0;
        style = 48;
        shadow = 0;
        access = 0;
        colorBackground[] = {0,0,0,0};
        colorText[] = {1,1,1,1};
        fixedWidth = 0;
        SizeEx = 0;
        tooltipColorBox[] = {1,1,1,1};
        tooltipColorShade[] = {0,0,0,0.65};
        tooltipColorText[] = {1,1,1,1};
        font = "Zeppelin32";

        text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_TL_ca.paa";
        h = "0.5 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
        w = "0.5 * 			(		((safezoneW / safezoneH) min 1.2) / 32)";
        x = "(safezoneX + safezoneW - 6.8 * 						(		((safezoneW / safezoneH) min 1.2) / 32))";
        y = "(7 * 						(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 			(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2)))";
      };

      class TR
      {
        idc = -1;
        type = 0;
        style = 48;
        shadow = 0;
        access = 0;
        colorBackground[] = {0,0,0,0};
        colorText[] = {1,1,1,1};
        fixedWidth = 0;
        SizeEx = 0;
        tooltipColorBox[] = {1,1,1,1};
        tooltipColorShade[] = {0,0,0,0.65};
        tooltipColorText[] = {1,1,1,1};
        font = "Zeppelin32";

        text = "A3\ui_f\data\GUI\Rsc\RscMiniMapSmall\GPS_TR_ca.paa";
        h = "0.5 * 			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
        w = "0.5 * 			(		((safezoneW / safezoneH) min 1.2) / 32)";
        x = "(safezoneX + safezoneW - 6.8 * 						(		((safezoneW / safezoneH) min 1.2) / 32)) + 				(6 * 						(		((safezoneW / safezoneH) min 1.2) / 32)) - (	0.5 * 			(		((safezoneW / safezoneH) min 1.2) / 32))";
        y = "(7 * 						(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) + 			(safezoneY + safezoneH - 				(		((safezoneW / safezoneH) min 1.2) / 1.2)))";
      };

    };
  };  
};
