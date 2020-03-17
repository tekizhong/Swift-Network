//
//  RxSwiftViewController.swift
//  Network
//
//  Created by Evergrande on 2017/7/5.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import UIKit
import RxSwift


class RxSwiftViewController: BaseTableViewController {
    
    let disposeBag = DisposeBag()
    let viewModel: RxSwiftViewModel = RxSwiftViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "使用Moya+HandyJSON+RxSwift"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func getData() {
//        viewModel.getPosts().subscribe(onNext: { (models: [RxHTMLModel]) in
//            print("count:\(models.count)")
//            self.dataArray = models as NSArray
//            self.tableView.reloadData()
//        }).addDisposableTo(disposeBag)
//        
//        
//        viewModel.createPost(title: "Title 1", body: "Body 1", userId: 1)
//            .subscribe(onNext: { (model: RxHTMLModel) in
//                //do something with post
//                print(model.title)
//            })
//            .addDisposableTo(disposeBag)
    }

}
