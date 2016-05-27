class RscTitles
{
	class chooseCityGUI
	{
		idd = 1000;
		duration = 99999;

		enableSimulation = 1;
		enableDisplay = 1;
		onLoad = "disableSerialization";

		class ControlsBackground
		{
			class dlgBackground: mcd_RscMapText
			{
				moving = 1;
				idc = 1001;
				text = "CHOOSE PLAYZONE (LMOUSE)";
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.6;
			};

      class confirmPlayZoneButton: mcd_RscConfirmBar
      {
        idc = 1002;
        text = "CONFIRM (ENTER)";
        x = safeZoneX + safeZoneW - 0.6 * 3/4;
        y = safeZoneY + safeZoneH - 1.545;
      };
		};
	};

	class chooseSpawnGUI
	{
		idd = 1100;
		duration = 99999;

		enableSimulation = 1;
		enableDisplay = 1;
		onLoad = "disableSerialization;";

		class ControlsBackground
		{
			class statusMessage: mcd_RscMapText
			{
				moving = 1;
				idc = 1101;
				text = "CHOOSE SPAWN (LMOUSE)";
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.6;
			};

      class waitMessage: mcd_RscConfirmBar
      {
        idc = 1102;
        text = "CONFIRM (ENTER)";
        x = safeZoneX + safeZoneW - 0.6 * 3/4;
        y = safeZoneY + safeZoneH - 1.545;
      };
		};
	};

	class opforWaitMessage
	{
		idd = 1200;
		duration = 99999;

		enableSimulation = 1;
		enableDisplay = 1;
		onLoad = "disableSerialization;";

		class ControlsBackground
		{
			class statusMessage: mcd_RscMapText
			{
				idc = 1201;
				text = "COMMANDER IS CHOOSING CITY";
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.6;
			};

      class waitMessage: mcd_RscMapTextSmall
      {
        idc = 1202;
        text = "PLEASE WAIT";
        x = safeZoneX + safeZoneW - 0.6 * 3/4;
        y = safeZoneY + safeZoneH - 1.545;
      };
		};
	};

	class bluforWaitMessage1
	{
		idd = 1300;
		duration = 99999;

		enableSimulation = 1;
		enableDisplay = 1;
		onLoad = "disableSerialization;";

		class ControlsBackground
		{
			class statusMessage: mcd_RscMapText
			{
				idc = 1301;
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.6;
				text = "OPFOR IS CHOOSING CITY";
			};

      class waitMessage: mcd_RscMapTextSmall
      {
        idc = 1302;
        text = "PLEASE WAIT";
        x = safeZoneX + safeZoneW - 0.6 * 3/4;
        y = safeZoneY + safeZoneH - 1.545;
      };
		};
	};

	class bluforWaitMessage2
	{
		idd = 1400;
		duration = 99999;

		enableSimulation = 1;
		enableDisplay = 1;
		onLoad = "disableSerialization; _this call mcd_fnc_waitDialogText;";

		class ControlsBackground
		{
			class statusMessage: mcd_RscMapText
			{
				moving = 1;
				idc = 1401;
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.6;
			};

      class waitMessage: mcd_RscMapTextSmall
      {
        idc = 1402;
        text = "PLEASE WAIT";
        x = safeZoneX + safeZoneW - 0.6 * 3/4;
        y = safeZoneY + safeZoneH - 1.545;
      };
		};
	};

	class bluforWaitMessage3
	{
		idd = 1500;
		duration = 99999;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization;";

		class ControlsBackground
		{
			class statusMessage: mcd_RscMapText
			{
				idc = 1501;
				text = "COMMANDER IS CHOOSING SPAWN";
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.6;
			};

      class waitMessage: mcd_RscMapTextSmall
      {
        idc = 1502;
        text = "PLEASE WAIT";
        x = safeZoneX + safeZoneW - 0.6 * 3/4;
        y = safeZoneY + safeZoneH - 1.545;
      };
		};
	};
};
