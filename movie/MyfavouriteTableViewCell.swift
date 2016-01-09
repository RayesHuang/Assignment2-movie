//
//  MyfavouriteTableViewCell.swift
//  movie
//
//  Created by Shuaiji Qian on 15/5/18.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

import UIKit

class MyfavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
