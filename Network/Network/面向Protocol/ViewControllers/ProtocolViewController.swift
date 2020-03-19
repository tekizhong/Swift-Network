//
//  ProtocolViewController.swift
//  Network
//
//  Created by Evergrande on 2017/7/5.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import UIKit

class ProtocolViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "使用自定义面向protocol"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func getData() {
        let request: RequestManager = RequestManager()
        
        
        request.sendGetWithResponseModel(HTMLReuqest.requestNone, responseType: TKChannels.self) { (model) in
            guard model != nil else {
                return
            }
            self.dataArray = model?.channels
            self.tableView.reloadData()
            print("array count :\(model?.channels?.count ?? -1)")
        }
    

    }
    
}
