#pragma semicolon 1
#include <sourcemod>
#include <sdktools>

#define PLUGIN_NAME     "Level chooser"
#define PLUGIN_AUTHOR   "Polaris (FoNg)"
#define PLUGIN_DESC     "Choose your outpost or survival game level"
#define PLUGIN_VERSION  "0.2.3"
#define PLUGIN_URL      "https://github.com/lamya3/mqsrv-insurgency-sourcemod-release"

Handle  cvar_Gamemode   = null;
char    Gamemode[32];

public Plugin:myinfo =
{
	name 			= PLUGIN_NAME,
	author 			= PLUGIN_AUTHOR,
	description 	= PLUGIN_DESC,
	version 		= PLUGIN_VERSION,
	url 			= PLUGIN_URL
}

#pragma newdecls required

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
	if(GetEngineVersion() == Engine_Insurgency) return APLRes_Success;

	FormatEx(error, err_max, "Plugin only for Insurgency (2014)");
	return APLRes_Failure;
}

public void OnPluginStart() 
{
	LoadTranslations("common.phrases.txt");
	RegAdminCmd("sm_lv",Command_LevelChange,ADMFLAG_ROOT);
	CreateConVar("sm_lv_version", PLUGIN_VERSION, "Level chooser plugin version", FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY|FCVAR_DONTRECORD);
}

public void OnMapStart()
{
    cvar_Gamemode = FindConVar("mp_gamemode");
    GetConVarString(cvar_Gamemode, Gamemode ,sizeof(Gamemode));
}

public Action Command_LevelChange(int client, int args)
{
    char arg1[32];
    GetCmdArg(1, arg1, sizeof(arg1));
    int Levelset = StringToInt(arg1);
    if(StrContains(Gamemode, "outpost", false) == -1 && StrContains(Gamemode, "survival", false) == -1)
    {
        PrintToConsole(client, "[Level Up Plugin] Not available except survival or outpost");
        return Plugin_Handled;
    }
    else if(args != 1)
    {
        PrintToConsole(client, "[Level Up Plugin] Parameter can't get! \n //Level maximum = 100 \n //Level minimum = 1 \n //Usage: sm_lv <int Level>");
        return Plugin_Handled;
    }
    else if(Levelset <= 0 || Levelset > 100)
    {
        PrintToConsole(client, "[Level Up Plugin] Parameter out of bounds or not a integer! \n //Level maximum = 100 \n //Level minimum = 1 \n //Usage: sm_lv <int Level>");
        return Plugin_Handled;
    }
    GameRules_SetProp("m_iLevel",StringToInt(arg1));
    return Plugin_Handled;
}