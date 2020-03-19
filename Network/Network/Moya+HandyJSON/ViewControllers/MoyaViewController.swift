//
//  MoyaViewController.swift
//  Network
//
//  Created by Evergrande on 2017/7/5.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import UIKit
import HandyJSON
class MoyaViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "使用Moya+HandyJSON"

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func getData() {
        
        let moyaRequest: MoyaRequest = MoyaRequest()
        moyaRequest.getListModel(success: { (model) in
            if let model = model as? TKChannels {
                self.dataArray = model.channels
                self.tableView.reloadData()
                print("array count:\(model.channels?.count ?? -1)")
            }
            
        }) { (error) in
            print("error")
        }

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
