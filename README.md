# ZZKong

早就想把自己使用的架构代码分享，实际项目中牵扯太多项目代码不好分离。刚好趁着这次重构“掌中控”项目，彻底分离出了项目公共架构。<br>

在这次找工作的过程中发现自己的工作机会极其少，既然如此，还是分享了吧，能让更多人受益。<br>

这个架构集中了我过去3年多时间开发中实际使用的大量组件、自定义UI控件、Category和工具类。<br>
整个架构可直接用到项目中，项目包含有大量的工具类和UI控件，解决登录等大量架构中的实际问题。<br>

架构中Common文件是项目一级目录，放置了所有项目（如果有多个）共有的公共组件，具体的多个项目代码可放在Modules中。<br>
*Common
  *CustomView  公共的自定义UI控件，大部分是根据需求编写的特殊显示样式
  *Category    公共的Category，实际上大量的辅助方法也写在对应的Category中
  *Controller  公共的Controller和VC
  *SystemView  系统View，在原有样式上添加了一些功能，建议继承使用
  *Utilities   非Category方式的工具类，颜色、边框、验证、日志、SB获取等等各种辅助工具类。
  *Network     对猿题库的二次封装
  *Define      宏处理，功能很强大，比如Toast、WEAK_SELF
  *DataCache   几种系统自带的持久化相关工具类
  *Delegate    系统公共代理
  
*Modules
  *Base        项目的真正系统目录，里面文件基本上继承自Common文件夹，然后成为项目
   *BaseVC     本项目VC，如果需要改变成为自己的项目，需修改TBC.m类
   *BaseView   本项目使用的系统View，基本上直接继承Common
   *Storyboard 项目中使用的SB放在此文件夹
  
  
其他：<br>

登录界面集成了生产和开发的网络切换，在打包之后网络切换功能会被自动隐藏<br>

示例代码：<br>
   *self.navigationBarHidden = YES;   /隐藏本页面NavigationBar
   *[self setNaviButtonType:ETNaviButtonReturn isLeft:YES];  //设置本页面左边出现回退按钮
   
里面功能太多，很难在一篇文章里说清楚，大量的功能需要使用者自己去摸索。<br>

Enjoy it！ 如果你真心觉得不错给个star吧！<br>

   
   

