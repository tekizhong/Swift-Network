//
//  MoyaViewController.swift
//  Network
//
//  Created by Evergrande on 2017/7/5.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import UIKit
import HandyJSON
class MoyaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "使用Moya+HandyJSON"
        self.view.backgroundColor = UIColor.white
        
        let moyaRequest: MoyaRequest = MoyaRequest()
        moyaRequest.getList(success: { (array) in
            if array != nil {
                print("array count:\(array?.count)")
            }
        }) { (error) in
            print("error")
        }
        
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
