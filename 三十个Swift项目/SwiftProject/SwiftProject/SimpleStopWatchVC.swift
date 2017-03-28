//
//  SimpleStopWatchVC.swift
//  SwiftProject
//
//  Created by zhangbinbin on 2017/3/28.
//  Copyright © 2017年 zhangbinbin. All rights reserved.
//

import UIKit

class SimpleStopWatchVC: UIViewController {
    
    var timer : Timer?
    
    var count = 0.0
    var timeLabel : UILabel?
    var isPlaying = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Simple Stop Watch"
        self.view.backgroundColor = UIColor.white
        
        let buttonsTitle:Array = ["开始","停止","重置"]
        
        for title:String in buttonsTitle {
            
            let index : Int = buttonsTitle.index(of: title)!
            
            let button = UIButton.init(type: UIButtonType.roundedRect)
            button.frame = CGRect.init(x: 20 + index * 80, y: 0, width: 60, height: 40)
            button.setTitle(title, for: UIControlState.normal)
            button.addTarget(self,
                             action:#selector(buttonClick(button:)),
                             for: UIControlEvents.touchUpInside)
            
            self.view.addSubview(button)
        }
        
        timeLabel = UILabel.init(frame: CGRect.init(x: 20,
                                                    y: 60,
                                                width: 100,
                                                height: 30))
        self.view.addSubview(timeLabel!)
        self.initTime()
        
    }
    
    func initTime() {
        if(timer != nil){
            
            timer?.invalidate()
            timer = nil
        }
        count = 0
        timeLabel?.text = "0.0"
        isPlaying = false
    }
    
    func buttonClick(button:UIButton) {
        if(button.currentTitle == "开始"){
            
            if(!isPlaying){
                self.initTime()
            }
            
            timer = Timer.scheduledTimer(timeInterval: 0.1,
                target: self,
                selector: #selector(time),
                userInfo: nil,
                repeats: true)
            
        }else if(button.currentTitle == "停止"){
            
            timer?.invalidate()
            timer = nil
            isPlaying = true
        }else{
            self.initTime()
        }
    }
    
    func time() {
        
        count += 0.1
        timeLabel?.text = String(format: "%.1f", count)
    }

}
