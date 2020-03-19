//
//  BaseViewController.swift
//  Network
//
//  Created by Evergrande on 2017/7/6.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController{

    var dataArray: Array<TKMusicModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.tableView.rowHeight = UITableView.automaticDimension;
        self.tableView.estimatedRowHeight = 90.0; // 设置为一个接近“平均”行高的值,用来估算修正tableView滚动条的高度
        self.tableView.register(UINib(nibName: "HDHTMLDisplayTableViewCell", bundle: nil), forCellReuseIdentifier:HDHTMLDisplayTableViewCell.identifier)
        
        getData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// 获取数据
    open func getData(){
        print("class:\(self)")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HDHTMLDisplayTableViewCell = tableView.dequeueReusableCell(withIdentifier: HDHTMLDisplayTableViewCell.identifier, for: indexPath) as! HDHTMLDisplayTableViewCell
        let model = self.dataArray?[indexPath.row]
        if let model = model {
            cell.titleLabel.text = model.name
            cell.bodyLabel.text = "ChannelId:\(model.channelId ?? "")"
        }
        return cell
    }

}






