//
//  TextViewController.swift
//  ZBBLearnSwift
//
//  Created by 张彬彬 on 2018/4/18.
//  Copyright © 2018年 zhangbinbin. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    open var content : String?
    let textView : UITextView = UITextView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textView.frame = self.view.bounds
        self.view.addSubview(self.textView)
        self.textView.text = content
        self.textView.isEditable = false
        
        let backButton = UIButton.init(frame: CGRect.init(x: 20, y: 80, width: 40, height: 40))
        backButton.setTitle("返回", for: UIControlState.normal)
        backButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        self.view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(TextViewController.back), for: UIControlEvents.touchUpInside)
    }

    func back() ->  Bool{
        self.dismiss(animated: true, completion: nil)
        
        return true
    }

}
