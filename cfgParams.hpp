class Params
{
    class WeatherSetting
    {
        title = "Weather";
        values[] = {-1,0,25,50,75,100};
        texts[] = {"Random","Clear","Cloudy","Overcast","Rainy","Stormy"};
        default = -1;
    };

    class TimeOfDay
    {
        title = "Time of Day";
        values[] = {-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
        texts[] = {"Random","00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00 (Sunrise)","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00 (Sunset)","19:00","20:00","21:00","22:00","23:00"};
        default = -1;
    };

    class BluforFaction
    {
        title = "Blufor Faction";
        values[] = {0,1,2,3,4,5};
        texts[] = {
            "USA - Army",
            "Russia - MSV",
            "Independent - Eastern European Nationalists",
            "Independent - PMC - (requires CUP Vehicles)",
            "Independent - Middle Eastern Terrorists - (requires Project Opfor)",
            "GER - Heer - (requires CUP Vehicles, GA Mod, ARC Ger, Redd 'n' Tank, NI Arms)"
        };
        default = 0;
    };

    class OpforFaction
    {
        title = "Opfor Faction";
        values[] = {0,1,2,3,4,5};
        texts[] = {
            "USA - Army",
            "Russia - MSV",
            "Independent - Eastern European Nationalists",
            "Independent - PMC - (requires CUP Vehicles)",
            "Independent - Middle Eastern Terrorists - (requires Project Opfor)",
            "GER - Heer - (requires CUP Vehicles, GA Mod, ARC Ger, Redd 'n' Tank, NI Arms)"
        };
        default = 1;
    };

    class Preset
    {
        title = "Preset";
        values[] = {0,1};
        texts[] = {
            "Custom",
            "Debug Mode (all parameters below will be ignored)"
        };
        default = 1;
    };

    class RankedMode
    {
        title = "Track Winrates";
        values[] = {0,1};
        texts[] = {"Off","On"};
        default = 1;
    };

    class DefenseTime
    {
        title = "Time to Defend the City (Minutes)";
        values[] = {120,900,1200,1500,1800,2100,2400,2700,3000,3300,3600,3900,4200,4500,4800};
        texts[] = {"2","15","20","25","30","35","40","45","50","55","60","65","70","75","80"};
        default = 3000;
    };

    class CaptureTime
    {
        title = "Time in Control to Capture City (Minutes)";
        values[] = {150,300,450,600,750,900};
        texts[] = {"2:30", "05:00", "07:30", "10:00", "12:30", "15:00"};
        default = 600;
    };

    class SetupTime
    {
        title = "Opfor Setup Time (Minutes)";
        values[] = {6,60,120,180,240,300,360,420,480,540,600};
        texts[] = {"0.1","1", "2", "3","4","5","6","7","8","9","10"};
        default = 300;
    };

    class ControlRatio
    {
        title = "Ratio to Control the City - Blufor:Opfor";
        values[] = {1,1.5,1.75,2,2.5,3,3.5,4,4.5,5};
        texts[] = {"1:1","1.5:1","1.75:1","2:1","2.5:1","3:1","3.5:1","4:1","4.5:1","5:1"};
        default = 2;
    };

    class MoneyFactor
    {
        title = "Money";
        values[] = {0.75,1,1.5};
        texts[] = {"Less", "Normal", "More"};
        default = 1;
    };

    class OpforRespawn
    {
        title = "Opfor Respawn";
        values[] = {0,1,2};
        texts[] = {"Disabled", "in Playzone", "outside Playzone"};
        default = 2;
    };

    class BluforRespawn
    {
        title = "Blufor Respawn";
        values[] = {0,1};
        texts[] = {"Disabled", "Enabled"};
        default = 1;
    };

    class bluforwavesize
    {
        title = "BLUFOR Respawn Wave Size";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        texts[] = {"Automatic", "1", "2","3","4","5","6","7","8","9","10","11","12","13","14","15"};
        default = 0;
    };

    class opforwavesize
    {
        title = "OPFOR Respawn Wave Size";
        values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        texts[] = {"Automatic", "1", "2","3","4","5","6","7","8","9","10","11","12","13","14","15"};
        default = 0;
    };

    class respawntime
    {
        title = "Player Respawn Time (Minutes)";
        values[] = {30,60,90,120,150,180,210,240,270,300,330,360,390,420,450,480,510,540,570,600};
        texts[] = {"0.5","1","1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10"};
        default = 210;
    };

    class waverespawntimeblu
    {
        title = "BLUFOR Wave Respawn Time (Minutes)";
        values[] = {30,60,90,120,150,180,210,240,270,300,330,360,390,420,450,480,510,540,570,600};
        texts[] = {"0.5","1","1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10"};
        default = 270;
    };

    class waverespawntimeopf
    {
        title = "OPFOR Wave Respawn Time (Minutes)";
        values[] = {30,60,90,120,150,180,210,240,270,300,330,360,390,420,450,480,510,540,570,600};
        texts[] = {"0.5","1","1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10"};
        default = 270;
    };
};
