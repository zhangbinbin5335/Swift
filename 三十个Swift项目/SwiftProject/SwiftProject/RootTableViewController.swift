//
//  RootTableViewController.swift
//  SwiftProject
//
//  Created by zhangbinbin on 2017/3/28.
//  Copyright © 2017年 zhangbinbin. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    
    var dataArray : Array<Dictionary<String, String>> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "30个Swift项目"
        
        dataArray = [
                        ["title":"Simple Stop Watch",
                         "class":"SimpleStopWatchVC"],
                        ["title":"Custom Font",
                         "class":"CustomFontVC"]
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

        cell.textLabel?.text = dataArray[indexPath.row]["title"]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    
        tableView .deselectRow(at: indexPath, animated: false)
        
        // 从info.plist读取namespace
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let className : String = nameSpace + "." +  dataArray[indexPath.row]["class"]!
        let classVC : AnyClass = NSClassFromString(className)!
        let vc = classVC.alloc() as! UIViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
