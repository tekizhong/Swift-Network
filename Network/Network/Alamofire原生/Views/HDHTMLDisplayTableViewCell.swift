//
//  HDHTMLDisplayTableViewCell.swift
//  Network
//
//  Created by Evergrande on 2017/7/6.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import UIKit

class HDHTMLDisplayTableViewCell: UITableViewCell {

    class var identifier: String {
        return "HDHTMLDisplayTableViewCell"
    }
    
    /// title
    @IBOutlet weak var titleLabel: UILabel!
    
    /// body
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.contentView.setNeedsLayout()
        self.contentView.layoutIfNeeded()
        ////对于单行label，这个属性不用设置；对于多行label，则需要设置最大autolayout宽度，如果文本超出这个属性指定的宽度，则会自动换行
        self.titleLabel.preferredMaxLayoutWidth = self.bounds.width - 30
        self.bodyLabel.preferredMaxLayoutWidth = self.bounds.width - 30
    }
}
