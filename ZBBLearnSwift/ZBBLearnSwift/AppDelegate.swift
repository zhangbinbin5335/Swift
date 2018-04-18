//
//  AppDelegate.swift
//  ZBBLearnSwift
//
//  Created by zhangbinbin on 2017/2/12.
//  Copyright © 2017年 zhangbinbin. All rights reserved.
//

import UIKit
import CoreData
import ZBBRunShell


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        ZBBRunShellManager.startService() // 并没有卵用
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = UINavigationController.init(rootViewController: ViewController())
        
        return true
    }
    
}

