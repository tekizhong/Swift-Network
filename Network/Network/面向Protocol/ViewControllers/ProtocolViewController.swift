//
//  ProtocolViewController.swift
//  Network
//
//  Created by Evergrande on 2017/7/5.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import UIKit

class ProtocolViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "使用自定义面向protocol"
        
        self.view.backgroundColor = UIColor.white
        
        let request: RequestManager = RequestManager()
        
        request.sendGetWithResponseModel(HTMLReuqest.requestByID(id: "1"), responseType: HTMLModel.self) { (model) in
            guard let model = model else {
                return
            }
            print("model id:\(model.id), body:\(model.body)")
        }
        
        
        request.sendGetWithResponseList(HTMLReuqest.requestNone, responseType: HTMLModel.self) { (array) in
            guard array != nil else {
                return
            }
            print("array count :\(array?.count)")
        }
        
        
        request.sendGetWithResponse(HTMLReuqest.requestByID(id: "1"), responseType: HTMLModel.self) { (response) in
            guard let response = response else {
                return
            }
            
            if let model = response as? HDHTMLModel {
                print("model id:\(model.id), body:\(model.body)")
            }
            
            if let array = response as? NSArray {
                print("array count :\(array.count)")
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
