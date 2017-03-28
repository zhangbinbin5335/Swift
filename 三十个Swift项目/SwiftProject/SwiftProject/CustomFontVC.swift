//
//  CustomFontVC.swift
//  SwiftProject
//
//  Created by zhangbinbin on 2017/3/28.
//  Copyright © 2017年 zhangbinbin. All rights reserved.
//

import UIKit

class CustomFontVC: UIViewController {
    
    var label:UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white

        label = UILabel.init(frame: CGRect.init(x: 20,
                                                y: 0,
                                                width: self.view.width,
                                                height: 200))
        label?.text = "Swift Custom Font,\n 1. 将字体文件.ttf添加到工程中 \n 2. 在info.plist配置Fonts provided by application \n 3. 找出字体名，就可以使用了"
        label?.numberOfLines = 0
        label?.font = UIFont.init(name: "Bit-Cheese10-sRB", size: 20)
        
        self.view.addSubview(label!)
        
//        for family in UIFont.familyNames {
//            
//            for font in UIFont.fontNames(forFamilyName: family) {
//                
//                print(font)
//                
//            }
//            
//        }
        let button = UIButton.init(type: UIButtonType.roundedRect)
        button .setTitle("变更字体", for: UIControlState.normal)
        button.frame = CGRect.init(x: (label?.x)!, y: (label?.y)! + (label?.height)!, width: 100, height: 40)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(buttonClick), for: UIControlEvents.touchUpInside)
    }
    
    func buttonClick() {
        label?.font = UIFont.init(name: "UniTortred", size: 20)
    }
}
