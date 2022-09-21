# mqsrv-insurgency-sourcemod

这是一个只用在游戏叛乱2（不是沙暴）的sourcemod插件源代码仓库。

为什么我会创建这个仓库：最近我关了我自己的服务器，但是有些插件或者代码是本身是开源的。有些带像是GPL这类许可证的，我必需去公开它（即使基本没有修改）；更多的是，很多来自sourcemod社区、steam讨论组、discord和github的大佬在sourcemod插件编写方便帮助了我很多。尽管我在编程方面很烂，但是我仍希望这个仓库能帮助到像我那样的sourcemod新手和服主。

绝大多数我自己的代码和我修改过，使用GPLv3许可证的源代码会发布在这个仓库。许可证只有GPLv3。如果这个仓库在某方面帮到你，请给我星星，或者去支持代码的原作者（我会尽可能贴出所有代码来源）。

(根据许可证约束，这个仓库的插件、源代码你可以自由使用/修改，甚至可以用在商业用途，但是不得闭源。你必需为客户提供源代码，修改过的代码也必需开源且同样使用GPLv3许可证。直接使用我的代码/插件需要署名我和向使用者提供本仓库的链接，不是我的代码请按照原作者的意愿适当署名)

请注意：此仓库绝大多数插件只能在叛乱2的PvE合作模式正常工作。

---

### 目录

- [关卡选择器](#关卡选择器)
- [列表锁定器](#列表锁定器161162)
- [前哨胜利补丁](#前哨胜利补丁)

---

### 关卡选择器

##### 描述

一个非常简单的调试插件。你可以用它输入一个命令去改变你当前的关卡。如果你直接编译这个插件的源代码，你只能在前哨或者生存模式下使用，且只能在0-100关之间调整（我不知道为什么前哨会有100关甚至更多...）

##### 插件文件

[level chooser.smx](https://github.com/lamya3/mqsrv-insurgency-sourcemod-release/blob/main/insurgency/addons/sourcemod/plugins/level%20chooser.smx)

##### 插件源代码

[level chooser.sp](https://github.com/lamya3/mqsrv-insurgency-sourcemod-release/blob/main/insurgency/addons/sourcemod/scripting/level%20chooser.sp)

##### 变量，命令与使用方法

```c
//命令
sm_lv <int>    //只需在游戏客户端控制台输入此命令和输入一个整数来代替<int> (在0到100之间的整数)
```

##### 来源与许可证

[Polaris](https://github.com/lamya3) ([GPLv3](https://raw.githubusercontent.com/lamya3/mqsrv-insurgency-sourcemod-release/main/LICENSE.md))

### 列表锁定器（1.6.1，1.6.2）

##### 描述

对的，你没有看错... 这个插件有两个版本，他们都是非常简单且有些小毛病。该插件可以强制使你的Playlist（游戏的服务器目录）强制为coop.playlist（标准合作模式），即使你在服务器使用非法的地图，比如说dust2这种自定义地图！1.6.1版本使用了`HookConVarChange()`去代替了1.6.2中的定时器循环，我认为1.6.1消耗更少的服务器性能但是1.6.2更稳定且容易配置。我难以选择一个更好的，所以我决定同时发布这两个版本，让大家自己做选择。

如果你用的是1.6.1版本，你必须使用一个官方地图加入启动参数去启动你的服务器，像是`+map sinjar_coop checkpoint`，然后启动完成后手动通过`map`命令切换到一个自定义地图；如果你用的是1.6.2版本，你可能不需要这样做。

最后，两个版本都不支持官图和自定义地图相互投票切换，你必须去掉mapcyclelist.txt内的任何官方地图。如果你通过游戏内置投票到某个官方地图，你将无法通过内置投票再切换到自定义地图，除非使用换图命令强制切换。

##### 插件文件

[Playlist coop enforcer 1.6.1.smx](https://github.com/lamya3/mqsrv-insurgency-sourcemod-release/blob/main/insurgency/addons/sourcemod/plugins/Playlist%20coop%20enforcer%201.6.1.smx)

[Playlist coop enforcer 1.6.2.smx](https://github.com/lamya3/mqsrv-insurgency-sourcemod-release/blob/main/insurgency/addons/sourcemod/plugins/Playlist%20coop%20enforcer%201.6.2.smx)

##### 插件源代码

[Playlist coop enforcer 1.6.1.sp](https://github.com/lamya3/mqsrv-insurgency-sourcemod-release/blob/main/insurgency/addons/sourcemod/scripting/Playlist%20coop%20enforcer%201.6.1.sp)

[Playlist coop enforcer 1.6.2.sp](https://github.com/lamya3/mqsrv-insurgency-sourcemod-release/blob/main/insurgency/addons/sourcemod/scripting/Playlist%20coop%20enforcer%201.6.2.sp)

##### 变量，命令与使用方法

```c
//这些插件没有命令与变量，即装即用。

//1.6.1
//使用此插件，需要注意初次开服需要默认地图（-map）为官方COOP列表允许的地图，比如+map tell_coop checkpoint
//除此之外还需要手动在游戏内在自定义地图和nwi/coop.playlist内允许的地图切换一次
//否则你的服务器在此操作之前将一直显示CUSTOM列表，通过map命令换地图也一样！你必需进去游戏内操作。

//1.6.2
//可能会直接开始工作，无需任何操作

//已知问题：
//1.在换图过程中可能会出现规则实体找不到的错误，对插件效果和游戏没有任何影响；
//2.服务器不能休眠，这个是为了插件起效果，是强制的；
//3.你只能在地图循环txt中使用自定义地图，因为在官图状态不能投票给自定义图（除了初次启动的官图）。
```

##### 来源与许可证

[Polaris](https://github.com/lamya3) ([GPLv3](https://raw.githubusercontent.com/lamya3/mqsrv-insurgency-sourcemod-release/main/LICENSE.md))


### 前哨胜利补丁

##### 描述

我们都知道，我们可以在前哨的20关取得成就（初次）。但是也许你不知道你根本没法在前哨模式中获得胜利，即使你神乎其技地玩到第2147483647关（32位整数）。你真的很想赢一次前哨模式？也许你可以试试这个插件！
这个插件可以设定一个关卡数值，当你到达这个预设的关卡数时会自动判定为胜利。尽管NWI貌似没有为前哨模式设计获胜状态？但是我在[bob](https://steamcommunity.com/id/TE4R/)的指导下依然尝试去还原它，最后我们成功了。

##### 插件文件

[End of outpost.smx]()

##### 插件源代码

[End of outpost.sp]()

##### 变量，命令与使用方法

```c
//变量
sm_outpost_endlevel 25 //判定获胜的关卡。3到2147483647的整数，默认是25。
```

##### 来源与许可证

[Polaris](https://github.com/lamya3) ([GPLv3](https://raw.githubusercontent.com/lamya3/mqsrv-insurgency-sourcemod-release/main/LICENSE.md))
