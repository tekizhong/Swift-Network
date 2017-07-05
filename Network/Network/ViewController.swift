//
//  ViewController.swift
//  Network
//
//  Created by Evergrande on 2017/7/4.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController{
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc: UIViewController = UIViewController()
        switch indexPath.row {
        case 0:
            vc = AlamofireViewController()
        case 1:
            vc = ProtocolViewController()
        case 2:
            vc = MoyaViewController()
        case 3:
            vc = RxSwiftViewController()
        default: break
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

