//
//  RefreshVC.swift
//  SwiftProject
//
//  Created by zhangbinbin on 2017/3/29.
//  Copyright © 2017年 zhangbinbin. All rights reserved.
//

import UIKit

class RefreshVC: UITableViewController {
    
    var dataArray : Array<String>!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        dataArray = ["😊😊😊😊😊",
                     "😢😢😢😢😢",
                     "❤️❤️❤️❤️❤️"]
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // UIRefreshController 给 UITableViewController 用的
        // 会有默认宽高
        // 用户上拉刷新会出发UIControlEventValueChanged事件
        let refreshController = UIRefreshControl.init(frame: CGRect.init())
        
        refreshController.addTarget(self,
                                    action: #selector(refreshEvent(controller:)),
                                    for: UIControlEvents.valueChanged)
        
        refreshController.attributedTitle = NSAttributedString.init(string: "上拉刷新")
        
        self.refreshControl = refreshController
    }
    
    // MARK : UITableViewDelegate & UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    // MARK : UIRefreshControl Event
    func refreshEvent(controller:UIRefreshControl) {
        
        dataArray.append("🌹🌹🌹🌹🌹")
        dataArray.append("🐔🐔🐔🐔🐔")
        dataArray.append("🐎🐎🐎🐎🐎")
        
        self.tableView.reloadData()
        controller.endRefreshing()
    }

}













