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
		class ErrorTitle: mcd_RscErrorTitle
		{
			moving = 1;
			idc = 9001;
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 - 0.05;
			text = "PLEASE CHOOSE A LOCATION!";
		};
	};

	class Controls {
		class ConfirmButton: mcd_RscErrorButton
		{
			idc = 9002;
			text = "OK";
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 + 0.005;
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
		class ErrorTitle: mcd_RscErrorTitle
		{
			moving = 1;
			idc = 9101;
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 - 0.05;
			text = "PLEASE CHOOSE A SPAWN POSITION BY CLICKING ON THE MAP";
		};
	};

	class Controls {
		class ConfirmButton: mcd_RscErrorButton
		{
			idc = 9102;
			text = "OK";
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 + 0.005;
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
		class ErrorTitle: mcd_RscErrorTitle
		{
			moving = 1;
			idc = 9201;
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 - 0.05;
			text = "PLEASE CHOOSE A SPAWN POSITION INSIDE THE BLUE AREA";
		};
	};

	class Controls {
		class ConfirmButton: mcd_RscErrorButton
		{
			idc = 9202;
			text = "OK";
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 + 0.005;
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
		class ErrorTitle: mcd_RscErrorTitle
		{
			moving = 1;
			idc = 9301;
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 - 0.05;
			text = "PLEASE CHOOSE A SPAWN POSITION ON LAND";
		};
	};

	class Controls {
		class ConfirmButton: mcd_RscErrorButton
		{
			idc = 9302;
			text = "OK";
			x = safeZoneX + safeZoneW * 0.5 - 0.5 * 3/4;
			y = safeZoneY + safeZoneH * 0.5 + 0.005;
			action = "closeDialog 0;";
		};
	};
};
