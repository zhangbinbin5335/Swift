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
 ```
 // 遍历出所以字体
 for family in UIFont.familyNames {
   for font in UIFont.fontNames(forFamilyName: family) {
      print(font)
   }
 }
 ```  
 
 #### 3. Carousel Effect  
 * `!` 表示强制解析.声明可选变量时使用感叹号（!）替换问号（?）。这样可选变量在使用时就不需要再加一个感叹号（!）来获取值，它会自动解析.  
 *  `UICollectionView`的使用,设置head和foot的高度可以设置前后space。  
 `UIVisualEffectView`的使用，效果体现在它后的view上。
 * 使用结构体定义数据结构  
 
 #### 4. UIRefreshControl
 * UIRefreshControl为UITableViewController定制的，固定样式。
 * 用户上啦会出发UIControlEventValueChanged事件，可以在这里做数据处理。
 
 
