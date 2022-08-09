# mqsrv-insurgency-sourcemod

这是一个只用在游戏叛乱2（不是沙暴）的sourcemod插件源代码仓库。

为什么我会创建这个仓库：最近我关了我自己的服务器，但是有些插件或者代码是本身是开源的。有些带像是GPL这类许可证的，我必需去公开它（即使基本没有修改）；更多的是，很多来自sourcemod社区、steam讨论组、discord和github的大佬在sourcemod插件编写方便帮助了我很多。尽管我在编程方面很烂，但是我仍希望这个仓库能帮助到像我那样的sourcemod新手和服主。

绝大多数我自己的代码和我修改过，使用GPLv2许可证的源代码会发布在这个仓库。许可证只有GPLv2。如果这个仓库在某方面帮到你，请给我星星，或者去支持代码的原作者（我会尽可能贴出所有代码来源）。

(根据许可证约束，这个仓库的插件、源代码你可以自由使用/修改，甚至可以用在商业用途，但是不得闭源。你必需为客户提供源代码，修改过的代码也必需开源且同样使用GPLv2许可证。直接使用我的代码/插件需要署名我和向使用者提供本仓库的链接，不是我的代码请按照原作者的意愿适当署名)

请注意：此仓库绝大多数插件只能在叛乱2的PvE合作模式正常工作。

---

### 目录

- [关卡选择器](#level-chooser)

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

[Polaris](https://github.com/lamya3) ([GPLv2](https://github.com/lamya3/mqsrv-insurgency-sourcemod-release/blob/main/LICENSE))
