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

        
        let param: [String: Any] = ["name_en":"Personal Radio","seq_id":0,"abbr_en":"My","name":"私人兆赫","channel_id":0]
        let model = TKMusicModel.deserialize(from: param)
        
        title = "使用Alamofire原生请求"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func getData() {
        let viewModel = HTMLViewModel()
        viewModel.getList { (array) in
            if array.count > 0 {
                self.dataArray = array as NSArray?
                self.tableView.reloadData()
                
                
                
//                array.forEach({ (model) in
//                    print("id:\(model.id),body:\(model.body)")
//                })
            }else {
                print("数量为空")
            }
            
        }
        
        
        viewModel.getModel(id: "1") { (model) in
            if let model = model as? TKChannels {
                self.dataArray = model.channels as? NSArray
                self.tableView.reloadData()

            }
        }
    }
    
      
}
