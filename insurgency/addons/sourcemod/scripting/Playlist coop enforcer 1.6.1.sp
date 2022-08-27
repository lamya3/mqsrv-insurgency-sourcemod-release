/* 
*Glitch of Insurgency2's Playlist/Playlist怪癖：
*To use this plugin: you have to set your map as game's built-in map in start commands, like +map tell_coop checkpoint
*使用此插件，需要注意初次开服需要默认地图（-map）为官方COOP列表允许的地图，比如+map tell_coop checkpoint
*in addition, inside the game, you need to change maps between built-in map and custom maps aleast once
*除此之外还需要手动在游戏内在自定义地图和nwi/coop.playlist内允许的地图切换一次
*or else, your server will only run in playlist custom, even use command map <map name>! you have to do like mentioned above. 
*！否则你的服务器在此操作之前将一直显示CUSTOM列表，通过map命令换地图也一样！你必需进去游戏内操作。
*
*Known bugs: 
*1.Throw can't find prop errors when changing map, but no hardly affects for game and plugins functions; 
*2.Server will not hibernate, cuz for maintenance functions;
*3.You can't vote a custom map when you change your map from a custom map to built-in map last time, so you have to use custom map only in mapcyclelist.txt (but built-in map when server start).
*已知问题：在换图过程中可能会出现规则实体找不到的错误，对插件效果和游戏没有任何影响；服务器不能休眠，这个是为了插件起效果，是强制的；你只能在地图循环txt中使用自定义地图，因为在官图状态不能投票给自定义图（除了初次启动的官图）。
*/

#pragma semicolon 1
#include <sourcemod>
#include <sdktools>

#define PLUGIN_DESCRIPTION	"Unlock playlist limited, allow map or etc."
#define PLUGIN_NAME 		"Playlist coop enforcer"
#define PLUGIN_VERSION		"1.6.1"
#define PLUGIN_AUTHOR		"Polaris (FoNg)"
#define PLUGIN_URL			"https://github.com/lamya3/mqsrv-insurgency-sourcemod-release"

new Handle:cvar_playList = INVALID_HANDLE;
new Handle:cvar_hibernate = INVALID_HANDLE;

public Plugin:myinfo = 
{
	name		= PLUGIN_NAME,
	author		= PLUGIN_AUTHOR,
	description	= PLUGIN_DESCRIPTION,
	version		= PLUGIN_VERSION,
	url			= PLUGIN_URL
};

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
	if(GetEngineVersion() == Engine_Insurgency) return APLRes_Success;

	FormatEx(error, err_max, "Plugin only for Insurgency (2014)");
	return APLRes_Failure;
}

public OnPluginStart() 
{
    	cvar_playList = FindConVar("sv_playlist");
	cvar_hibernate = FindConVar("sv_hibernate_when_empty");
	SetConVarString(cvar_playList, "nwi/coop", true);
	SetConVarBool(cvar_hibernate,false,true);
    	HookConVarChange(cvar_playList, ConVarChanged);
	HookConVarChange(cvar_hibernate, ConVarChanged);
}

public OnMapStart()
{
	PlaylistEnabled();
}

public void ConVarChanged(Handle hConVar, const char[] sOldValue, const char[] sNewValue)
{
    	SetConVarBool(cvar_hibernate,false,true);
	PlaylistEnabled();
}

public void PlaylistEnabled()
{
	SetConVarString(cvar_playList, "nwi/coop", true);
	GameRules_SetProp("m_bPlaylistEnabled", true);
}
