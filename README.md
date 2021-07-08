# auto_use_treasure_map  
梦幻西游自动挖宝，触动精灵开源脚本，适用设备1920x1080，需要root，一加五实测在android8下运行比android9下运行流畅。  
  
项目名：beta  
刚刚开源注释较少，核心代码在orcr.lua  
  
代码使用方法：  
1、触动精灵开发者平台（https://dev.touchsprite.com ）注册账号并实名认证  
2、下载触动精灵脚本编辑器（https://www.touchsprite.com/download ）3.0.6或1.2.3都可以  
3、打开触动精灵脚本编译器新建工程，然后把代码复制到新建的工程内，再回到编译器，把带划线的代码重新关联（3.0.6）  
打开触动精灵脚本编译器新建工程(beta)，然后把代码复制到新建的工程内，再重启编译器（1.2.3）  
4、如果有root的手机则使用手机下载触动精灵客户端（https://www.touchsprite.com/download ）触动精灵android root版或触动精灵ios 越狱版  
如果没有root的手机可以下载android模拟器（推荐夜神模拟器，可以自动生成手机参数，可以模拟成真实手机）  
5、在手机或模拟器上打开触动精灵，注册账号，登陆并激活vip（注册触动精灵开发者后，可以绑定一个触动精灵客户端账号为永久vip，绑定成功后不需要重新的登陆）  
6、连接设备，并发送工程到设备  
7、在触动精灵脚本页面选中main.lua 然后切换到梦幻西游页面 点击“音量-”键即可启动脚本，脚本经过各种调试，不用任何修改即可使用，使用中可能会发生一些问题，如：  
1、西梁女国仓库位置正好有npc重叠，  
2、普陀山穿送人正好有npc重叠，  
3、长寿郊外到北俱芦洲传送人正好有npc重叠。  
4、战斗死亡见小白  
5、由于过于卡顿导致异常  
6、其他异常  
  
  
脚本使用方法：  
挖宝前宝图准备，自行购买宝图，自行开图之后存入仓库  
游戏页面准备，把消息栏缩小，把任务栏隐藏，设置好人物自动攻击的方式和召唤兽自动攻击的方式，推荐使用带吸血技能或高级吸血技能的召唤兽。  
背包物品准备：背包前三排为放置宝图的区域（如果有物品脚本启动后会自动存入仓库），第四排为挖宝必要物资，第四排请放置30个摄妖香，60个飞行服，一个红罗庚，一个绿罗庚。（顺序没有要求，会自动寻找自动判断，如果购买了秘制红罗庚和秘制绿罗庚可以不放药）  
加血说明：使用宝图后会判断雪亮，人物血量低于98%会自动补血，召唤兽血量低于75%会自动补血。  
战斗说明：挖宝遇到妖怪会点击自动来进行战斗。  
  
关于封号测试：  
本代码经历两个大版本迭代，  
版本一：只挖宝，生日快乐区75级号紧挖一天第二天封号（原因：使用脚本），75级转钱角色在第一个账号被封第二天封号（原因：转移不当得利）  
版本二（当前版本）：会做一些打开背包遍历宝图的事情，会在挖宝前先点击其他宝图再挖正确的宝图。自挖自卖。  
首先，枫桥夜泊109级号连挖10天没有封号（每天200张），因为东西不好卖止挖了。  
然后，生日快乐75级号连挖13天没有封号（每天200-400张），改为三个75级号一起挖，第16天封号。  
之后，黄金台40级号挖1天后（130张），第二天下午封号。  

推荐转移资产方法：
自行清货，谁挖的谁清理，然后把清理的钱分别打给3个新注册账号，3个新注册账号再全部打给另外一个新注册账号，再又另外一个账号与主账号交易（主账号提供垃圾蓝字武器，最好为不同ip）

  
交流qq群：493407681  
  
免责条款：  
本代码仅用于交流学习，禁止用于任何非法用途，本人不承担由于使用本段代码而导致的任何法律或非法律问题，请遵守国家法律法规。如有侵权，请加qq群联系管理员：493407681。  
