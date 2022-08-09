# mqsrv-insurgency-sourcemod
<br>
<div align=center>
README also available in Chinese simplified: <a href="https://github.com/lamya3/mqsrv-insurgency-sourcemod-release/blob/main/README_zh_CN.md">中文自述文件</a>
</div>
<br>

A source code repository of sourcemod plugins, which can be used for game insurgency.

So why did I create this repository:  I closed my server few months ago, but the code of some plugins on my server are opensource. Base on their licences, I have to release them; for another, many senior sourcemod coder from sourcemod community, steam discussions, discord and github help me a lot with programming. Although I'm not good at coding at all, but I still hope this repository can help more sourcemod novices or server owners like me.

Most of my code and GPLv2 sourcecode from other authors I was modified will be released in this repository, only GPLv2. If it helps you, please give a star for me or support original author.

(There may be ambiguity or difficult to understand what's mean in README, excuse my poor English ...)

Attention: most of plugins in this repository can only work in insurgency2 cooperative mode normally.

---

### Contents

- [Level chooser](#level-chooser)

---

### Level chooser

##### Description

A very simple debug plugin. You can use it to change your current game level by a command. If you compile this plugin's sourcecode directly, you can only use it on game mode outpost or survival,  and change level between 0 to 100. (IDK why outpost have level 100 even more......)

##### Plugin's smx

[level chooser.smx](https://github.com/lamya3/mqsrv-insurgency-sourcemod-release/blob/main/insurgency/addons/sourcemod/plugins/level%20chooser.smx)

##### Sourcecode

[level chooser.sp](https://github.com/lamya3/mqsrv-insurgency-sourcemod-release/blob/main/insurgency/addons/sourcemod/scripting/level%20chooser.sp)

##### Cvars, commands and usage

```c
//commands
sm_lv <int>    //Just use it in client console and input a level number to replace <int> (integer between 0 to 100)
```

##### Source and license

[Polaris](https://github.com/lamya3) ([GPLv2](https://github.com/lamya3/mqsrv-insurgency-sourcemod-release/blob/main/LICENSE))
