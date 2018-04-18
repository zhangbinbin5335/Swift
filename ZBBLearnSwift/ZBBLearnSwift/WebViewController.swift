//
//  WebViewController.swift
//  ZBBLearnSwift
//
//  Created by 张彬彬 on 2018/4/16.
//  Copyright © 2018年 zhangbinbin. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    open var loadUrl : URL?
    let webview : UIWebView = UIWebView.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webview.frame = self.view.bounds
        self.view.addSubview(self.webview)
        self.webview.loadRequest(URLRequest.init(url: loadUrl!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
