//
//  RxSwiftViewController.swift
//  Network
//
//  Created by Evergrande on 2017/7/5.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import UIKit
import RxSwift


class RxSwiftViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "使用Moya+HandyJSON+RxSwift"
        self.view.backgroundColor = UIColor.white
        
        let disposeBag = DisposeBag()
        
        let viewModel: RxSwiftViewModel = RxSwiftViewModel()
        
        viewModel.getPosts().subscribe(onNext: { (models: [RxHTMLModel]) in
            print("count:\(models.count)")
        }).addDisposableTo(disposeBag)
        
        
        viewModel.createPost(title: "Title 1", body: "Body 1", userId: 1)
            .subscribe(onNext: { (model: RxHTMLModel) in
                //do something with post
                print(model.title)
            })
            .addDisposableTo(disposeBag)

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
