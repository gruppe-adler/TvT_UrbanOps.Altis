class choosePlayzoneGUI
{
		idd = 1000;
		movingenable = 1;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization";


		class ControlsBackground
		{
			class dlgBackground: background
			{
				moving = 1;
				idc = 1900;
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
				idc = 1501;
				text = "CONFIRM";
				x = safeZoneX + safeZoneW - 0.6 * 3/4;
				y = safeZoneY + safeZoneH - 1.545;
				w = 0.52 * 3/4;
				h = 0.05;
				action = "closeDialog 0; hint 'asd'";
			};
		};

};

class chooseCityErrorMessage
{
		idd = 1001;
		movingenable = 1;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization; player say3d 'defaultNotification'";

		class ControlsBackground
		{
			class dlgBackground: background
			{
				moving = 1;
				idc = 1901;
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
				idc = 1502;
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
		idd = 1001;
		movingenable = 1;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization; player say3d 'defaultNotification'";

		class ControlsBackground
		{
			class dlgBackground: background
			{
				moving = 1;
				idc = 1901;
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
				idc = 1502;
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
		idd = 1001;
		movingenable = 1;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization; player say3d 'defaultNotification'";

		class ControlsBackground
		{
			class dlgBackground: background
			{
				moving = 1;
				idc = 1901;
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
				idc = 1502;
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
		idd = 1001;
		movingenable = 1;

		enableSimulation = 1;
		enableDisplay = 1;
		objects[] = {};
		onLoad = "disableSerialization; player say3d 'defaultNotification'";

		class ControlsBackground
		{
			class dlgBackground: background
			{
				moving = 1;
				idc = 1901;
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
				idc = 1502;
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
					idc = 1999;
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
					idc = 1501;
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
					idc = 1999;
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
					idc = 1501;
					text = "CONFIRM (ENTER)";
					x = safeZoneX + safeZoneW - 0.6 * 3/4;
					y = safeZoneY + safeZoneH - 1.545;
					w = 0.52 * 3/4;
					h = 0.05;
					action = "";
				};
			};

	};
};
