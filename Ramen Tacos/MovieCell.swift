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
    var posterView: UIImageView!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let rowHeight = 90
        let pad = 2
        let posterWidth = 51
        let posterHeight = 81
        let appWidth = Int(UIScreen.mainScreen().applicationFrame.width)
        
        let titleRect = CGRect(
            x: pad + pad + posterWidth,
            y: pad,
            width: appWidth - posterWidth - pad * 3,
            height: 15
        )

        self.titleLabel = UILabel(frame: titleRect)
        self.titleLabel.backgroundColor = UIColor.greenColor()
        self.titleLabel.font = UIFont.systemFontOfSize(13.0, weight: 0.8)
        
        let synopsisRect = CGRect(
            x: pad + pad + posterWidth,
            y: pad + pad + Int(titleRect.height),
            width: Int(titleRect.width),
            height: 81 - pad - Int(titleRect.height)
        )
        
        self.synopsisLabel = UILabel(frame: synopsisRect)
        self.synopsisLabel.backgroundColor = UIColor.orangeColor()
        self.synopsisLabel.font = UIFont.systemFontOfSize(11.0)
        self.synopsisLabel.numberOfLines = 4
        
        let posterRect = CGRect(
            x: pad,
            y: pad,
            width: posterWidth,
            height: posterHeight
        )
        
        self.posterView = UIImageView(frame: posterRect)

        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.synopsisLabel)
        self.contentView.addSubview(self.posterView)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)

        // Configure the view for the selected state
    }

}
