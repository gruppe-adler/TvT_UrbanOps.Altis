class chooseCityErrorMessage
{
	idd = 9000;
	movingenable = 1;

	enableSimulation = 1;
	enableDisplay = 1;
	objects[] = {};
	onLoad = "disableSerialization; player say 'defaultNotification'";

	class ControlsBackground
	{
		class dlgBackground: background
		{
			moving = 1;
			idc = 9001;
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 - 0.05;
			w = 1.0 * 3/4;
			h = 0.05;
			colorBackground[] = {0,0,0,0.8};
			text = "PLEASE CHOOSE A LOCATION!";
		};
	};

	class Controls {
		class confirmErrorMessageButton: mcdButton
		{
			idc = 9002;
			text = "OK";
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 + 0.005;
			w = 1.0 * 3/4;
			h = 0.05;
			action = "closeDialog 0;";
		};
	};
};

class spawnselectErrorMessage1
{
	idd = 9100;
	movingenable = 1;

	enableSimulation = 1;
	enableDisplay = 1;
	objects[] = {};
	onLoad = "disableSerialization; player say 'defaultNotification'";

	class ControlsBackground
	{
		class dlgBackground: background
		{
			moving = 1;
			idc = 9101;
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 - 0.05;
			w = 1.0 * 3/4;
			h = 0.05;
			colorBackground[] = {0,0,0,0.8};
			text = "PLEASE CHOOSE A SPAWN POSITION BY CLICKING ON THE MAP";
		};
	};

	class Controls {
		class confirmErrorMessageButton: mcdButton
		{
			idc = 9102;
			text = "OK";
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 + 0.005;
			w = 1.0 * 3/4;
			h = 0.05;
			action = "closeDialog 0;";
		};
	};
};

class spawnselectErrorMessage2
{
	idd = 9200;
	movingenable = 1;

	enableSimulation = 1;
	enableDisplay = 1;
	objects[] = {};
	onLoad = "disableSerialization; player say 'defaultNotification'";

	class ControlsBackground
	{
		class dlgBackground: background
		{
			moving = 1;
			idc = 9201;
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 - 0.05;
			w = 1.0 * 3/4;
			h = 0.05;
			colorBackground[] = {0,0,0,0.8};
			text = "PLEASE CHOOSE A SPAWN POSITION INSIDE THE BLUE AREA";
		};
	};

	class Controls {
		class confirmErrorMessageButton: mcdButton
		{
			idc = 9202;
			text = "OK";
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 + 0.005;
			w = 1.0 * 3/4;
			h = 0.05;
			action = "closeDialog 0;";
		};
	};
};

class spawnselectErrorMessage3
{
	idd = 9300;
	movingenable = 1;

	enableSimulation = 1;
	enableDisplay = 1;
	objects[] = {};
	onLoad = "disableSerialization; player say 'defaultNotification'";

	class ControlsBackground
	{
		class dlgBackground: background
		{
			moving = 1;
			idc = 9301;
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 - 0.05;
			w = 1.0 * 3/4;
			h = 0.05;
			colorBackground[] = {0,0,0,0.8};
			text = "PLEASE CHOOSE A SPAWN POSITION ON LAND";
		};
	};

	class Controls {
		class confirmErrorMessageButton: mcdButton
		{
			idc = 9302;
			text = "OK";
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 + 0.005;
			w = 1.0 * 3/4;
			h = 0.05;
			action = "closeDialog 0;";
		};
	};
};

class RscTitles
{
	class chooseCityGUI
	{
		idd = 1000;
		movingenable = 1;
		duration = 99999;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization";

		class ControlsBackground
		{
			class dlgBackground: background
			{
				moving = 1;
				idc = 1001;
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.6;
				w = 0.52 * 3/4;
				h = 0.05;
				colorBackground[] = {0,0,0,0.8};
				text = "CHOOSE PLAYZONE (LMOUSE)";
			};
		};

		class Controls {
			class confirmPlayZoneButton: mcdButton
			{
				idc = 1002;
				text = "CONFIRM (ENTER)";
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.545;
				w = 0.52 * 3/4;
				h = 0.05;
				action = "";
			};
		};
	};

	class chooseSpawnGUI
	{
		idd = 1100;
		movingenable = 1;
		duration = 99999;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization;";


		class ControlsBackground
		{
			class dlgBackground: background
			{
				moving = 1;
				idc = 1101;
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.6;
				w = 0.52 * 3/4;
				h = 0.05;
				colorBackground[] = {0,0,0,0.8};
				text = "CHOOSE SPAWN (LMOUSE)";
			};
		};

		class Controls {
			class confirmPlayZoneButton: mcdButton
			{
				idc = 1102;
				text = "CONFIRM (ENTER)";
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.545;
				w = 0.52 * 3/4;
				h = 0.05;
				action = "";
			};
		};
	};

	class opforWaitMessage
	{
		idd = 1200;
		movingenable = 1;
		duration = 99999;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization;";

		class ControlsBackground
		{
			class dlgBackground: background
			{
				moving = 1;
				idc = 1201;
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.6;
				w = 0.52 * 3/4;
				h = 0.05;
				colorBackground[] = {0,0,0,0.8};
				text = "COMMANDER IS CHOOSING CITY";
			};
		};

		class Controls {
			class dlgBackground: background_smalltext
			{
				idc = 1202;
				text = "PLEASE WAIT";
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.545;
				w = 0.52 * 3/4;
				h = 0.05;
				action = "";
			};
		};
	};

	class bluforWaitMessage1
	{
		idd = 1300;
		movingenable = 1;
		duration = 99999;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization;";

		class ControlsBackground
		{
			class dlgBackground: background
			{
				moving = 1;
				idc = 1301;
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.6;
				w = 0.52 * 3/4;
				h = 0.05;
				colorBackground[] = {0,0,0,0.8};
				text = "OPFOR IS CHOOSING CITY";
			};
		};

		class Controls {
			class dlgBackground: background_smalltext
			{
				idc = 1302;
				text = "PLEASE WAIT";
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.545;
				w = 0.52 * 3/4;
				h = 0.05;
				action = "";
			};
		};
	};

	class bluforWaitMessage2
	{
		idd = 1400;
		movingenable = 1;
		duration = 99999;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization; _this call mcd_fnc_waitDialogText;";

		class ControlsBackground
		{
			class dlgBackground: background
			{
				moving = 1;
				idc = 1401;
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.6;
				w = 0.52 * 3/4;
				h = 0.05;
				colorBackground[] = {0,0,0,0.8};
				text = "OPFOR IS SETTING UP";
			};
		};

		class Controls {
			class dlgBackground: background_smalltext
			{
				idc = 1402;
				text = "PLEASE WAIT";
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.545;
				w = 0.52 * 3/4;
				h = 0.05;
				action = "";
			};
		};
	};

	class bluforWaitMessage3
	{
		idd = 1500;
		movingenable = 1;
		duration = 99999;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization;";

		class ControlsBackground
		{
			class dlgBackground: background
			{
				moving = 1;
				idc = 1501;
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.6;
				w = 0.52 * 3/4;
				h = 0.05;
				colorBackground[] = {0,0,0,0.8};
				text = "COMMANDER IS CHOOSING SPAWN";
			};
		};

		class Controls {
			class dlgBackground: background_smalltext
			{
				idc = 1502;
				text = "PLEASE WAIT";
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.545;
				w = 0.52 * 3/4;
				h = 0.05;
				action = "";
			};
		};
	};
};
