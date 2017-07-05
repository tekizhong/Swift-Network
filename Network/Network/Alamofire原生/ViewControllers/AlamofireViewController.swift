//
//  AlamofireViewController.swift
//  Network
//
//  Created by Evergrande on 2017/7/4.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let viewModel = HTMLViewModel()
        viewModel.getList { (array) in
            if array.count > 0 {
                array.forEach({ (model) in
                    print("id:\(model.id),body:\(model.body)")
                })

            }else {
                print("数量为空")
            }
            
        }
        
        
        viewModel.getModel(id: "1") { (model) in
            if let model = model as? HTMLModel {
                
                print("model:\(model.id) body:\(model.body)")
            }
        }
        
        
        title = "使用Alamofire原生请求"
        
        self.view.backgroundColor = UIColor.white
        
//        Alamofire.request(URL).responseString { (response) in
//            print("返回的值:\(response)")
//        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
