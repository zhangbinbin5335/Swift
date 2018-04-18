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
    var dataSource : Array<String>?
    
    var _fileUrl : String?
    
    
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
    
    // UITableViewDelegate,UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "swiftCell")
        if(cell == nil){
            
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "swiftCell")
        }
        
        cell?.textLabel?.text = dataSource?[indexPath.item]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource!.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: false)
        
        let fileName = dataSource?[indexPath.item]
        _fileUrl = String.init(format: "http://127.0.0.1:8081/swift/%@", fileName!)
//        let webVC = WebViewController();
//        webVC.loadUrl = URL.init(string: _fileUrl!)
//        self.present(webVC, animated: true, completion: nil)
        
        let dataTask = URLSession.shared.dataTask(with: URL.init(string: _fileUrl!)!) { (data, response, error) in
            if (data != nil){
                let content = (String.init(data: data!, encoding: String.Encoding.utf8));
                let textVC = TextViewController();
                textVC.content = content
                DispatchQueue.main.async {
                    self.present(textVC, animated: true, completion: nil)
                }
            }
        }
        dataTask.resume()
        
        return
        let quickLookVC = QLPreviewController.init()
        quickLookVC.dataSource = self
        
        
        quickLookVC.navigationController?.title = fileName
        
        _fileUrl = String.init(format: "http://127.0.0.1:8081/swift/%@", fileName!)
        
        self.navigationController?.pushViewController(quickLookVC, animated: true)
    }
    
    //QLPreviewControllerDelegate,QLPreviewControllerDataSource
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1;
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return NSURL.init(string: _fileUrl! as String)!
    }

}

