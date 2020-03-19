//
//  AlamofireViewController.swift
//  Network
//
//  Created by Evergrande on 2017/7/4.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import UIKit
import Alamofire


class AlamofireViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "使用Alamofire原生请求"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func getData() {
        let viewModel = HTMLViewModel()
    
        viewModel.getModel() { (model) in
            if let model = model as? TKChannels {
                self.dataArray = model.channels
                self.tableView.reloadData()

            }
        }
    }
    
      
}
