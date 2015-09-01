//
//  MovieCellTableViewCell.swift
//  Ramen Tacos
//
//  Created by Matt Hayes on 8/31/15.
//  Copyright (c) 2015 Mystery Command. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    var titleLabel: UILabel!
    var synopsisLabel: UILabel!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.titleLabel = UILabel(frame: CGRect(x: 5, y: 5, width: 310, height: 30))
        self.titleLabel.backgroundColor = UIColor.greenColor()
        self.contentView.addSubview(self.titleLabel)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
