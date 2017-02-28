//
//  ViewController.swift
//  ZBBLearnSwift
//
//  Created by zhangbinbin on 2017/2/12.
//  Copyright © 2017年 zhangbinbin. All rights reserved.
//

import UIKit

import QuickLook

class ViewController: UIViewController,
UITableViewDelegate,
UITableViewDataSource,
QLPreviewControllerDelegate,
QLPreviewControllerDataSource{

    var tableView : UITableView?
    var dataSource : NSMutableArray?
    
    var _fileUrl : NSString?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UITableViewCell().classForCoder, forCellReuseIdentifier: "swiftCell")
        
        self.view.addSubview(tableView!)
        
        dataSource = ["swiftBasics",
                      "Swift_ConstantsVariables",
                      "Swift_Array",
                      "Swift_Optionals",
                      "Swift_ControlFlow",
                      "Swift_FuncAndClosures"]
    }
    
    //UITableViewDelegate,UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "swiftCell")
        if(cell == nil){
            
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "swiftCell")
        }
        
        cell?.textLabel?.text = dataSource?.object(at: indexPath.row) as! String?
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource!.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: false)
        
        let quickLookVC = QLPreviewController.init()
        quickLookVC.dataSource = self
        quickLookVC.navigationController?.title = dataSource?.object(at: indexPath.row) as! String?
        
        _fileUrl =
        
        NSString.init(format: "/Users/zhangbinbin/Documents/daydayup/Swift/%@.playground/Contents.swift",
                      dataSource?.object(at: indexPath.row) as! CVarArg)
        
        self.navigationController?.pushViewController(quickLookVC, animated: true)
    }
    
    //QLPreviewControllerDelegate,QLPreviewControllerDataSource
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1;
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        if (_fileUrl?.hasPrefix("file://"))! {
            return NSURL.init(string: _fileUrl as! String)!
        }
        return NSURL.fileURL(withPath: _fileUrl as! String) as QLPreviewItem
    }

}

