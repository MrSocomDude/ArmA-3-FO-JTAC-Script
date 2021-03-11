Step 1: Copy the EPD folder to your Mission Folder

Step 2: Create a init.sqf add the following:

call compile preprocessFileLineNumbers "EPD\VirtualJTAC\init.sqf";

Step 3: Create a description.ext and add the following

class CfgNotifications
{
	class JtacReloadNotification
	{
		title = "JTAC";
		iconPicture = "a3\ui_f\data\gui\cfg\communicationmenu\call_ca.paa";
		iconText = "1";
		description = "%1";
		color[] = {0.153, 0.933, 0.122, 1};
		duration = 5;
		priority = 0;
		difficulty[] = {};
	};
}

Step 4: In the player init add the following: 

this setVariable ["JTAC",true];