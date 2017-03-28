[swift 的 100 天](http://samvlu.com/index.html)
[三十天三十个 Swift 项目](http://www.jianshu.com/p/52032bc4cbe4)
# Swift 光看没用，每天做个小项目，做到真正的掌握。
#### 1. Simple Stop Watch  
 * ##### NSTimer 来做定时器：NSTimer.scheduledTimerWithTimeInterval；
 * 开始、暂停以及重新计时三个功能；   
 
 ```
 //  swift 动态获取类
 // 从info.plist读取namespace
 let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
 let className : String = nameSpace + "." +  dataArray[indexPath.row]["class"]!
 
 let classVC : AnyClass = NSClassFromString(className)!
 let vc = classVC.alloc() as! UIViewController  
 
 // 添加选择子
 #selector(buttonClick(button:)    
 ```
 #### 2. Custom Font  
 * 将字体文件.ttf添加到工程中
 * 在info.plist配置Fonts provided by application
 * 找出字体名，就可以使用了  
 
 // 遍历出所以字体
 for family in UIFont.familyNames {
 
 for font in UIFont.fontNames(forFamilyName: family) {
 print(font)
 }
 }
