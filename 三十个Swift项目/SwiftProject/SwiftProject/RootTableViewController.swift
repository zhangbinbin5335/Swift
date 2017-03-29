//
//  RootTableViewController.swift
//  SwiftProject
//
//  Created by zhangbinbin on 2017/3/28.
//  Copyright © 2017年 zhangbinbin. All rights reserved.
//

import UIKit

private let kInfoKeyTitle = "title"
private let kInfoKeyClass = "class"

class RootTableViewController: UITableViewController {
    
    var dataArray : Array<Dictionary<String, String>> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "30个Swift项目"
        
        dataArray = [
                        [kInfoKeyTitle : "Simple Stop Watch",
                         kInfoKeyClass : "SimpleStopWatchVC"],
                        
                        [kInfoKeyTitle : "Custom Font",
                         kInfoKeyClass : "CustomFontVC"],
                        
                        [kInfoKeyTitle : "Carousel Effect",
                         kInfoKeyClass : "CarouselEffectVC"]
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rootReuseIdentifier", for: indexPath)

        cell.textLabel?.text = dataArray[indexPath.row][kInfoKeyTitle]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    
        tableView .deselectRow(at: indexPath, animated: false)
        
        // 从info.plist读取namespace
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let className : String = nameSpace + "." +  dataArray[indexPath.row][kInfoKeyClass]!
        let classVC : AnyClass = NSClassFromString(className)!
        let vc = classVC.alloc() as! UIViewController
        vc.title = dataArray[indexPath.row][kInfoKeyTitle]!
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
