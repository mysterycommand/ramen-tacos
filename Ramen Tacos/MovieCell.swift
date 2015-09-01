//
//  MovieCellTableViewCell.swift
//  Ramen Tacos
//
//  Created by Matt Hayes on 8/31/15.
//  Copyright (c) 2015 Mystery Command. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    static let padX = 6
    static let padY = 3
    static let posterWidth = 51
    static let posterHeight = 81

    static var rowHeight: Int {
        get { return MovieCell.padY + MovieCell.padY + MovieCell.posterHeight }
    }

    var titleLabel: UILabel!
    var synopsisLabel: UILabel!
    var posterView: UIImageView!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let appWidth = Int(UIScreen.mainScreen().applicationFrame.width)
        
        let titleRect = CGRect(
            x: MovieCell.posterWidth + MovieCell.padX,
            y: 0,
            width: appWidth - MovieCell.posterWidth - MovieCell.padX,
            height: 13
        )

        self.titleLabel = UILabel(frame: titleRect)
        self.titleLabel.backgroundColor = UIColor.greenColor()
        self.titleLabel.font = UIFont.systemFontOfSize(12.0, weight: 0.3)
        
        let synopsisRect = CGRect(
            x: MovieCell.posterWidth + MovieCell.padX,
            y: MovieCell.padY + Int(titleRect.height),
            width: Int(titleRect.width),
            height: MovieCell.posterHeight - MovieCell.padY - Int(titleRect.height)
        )
        
        self.synopsisLabel = UILabel(frame: synopsisRect)
        self.synopsisLabel.backgroundColor = UIColor.orangeColor()
        self.synopsisLabel.font = UIFont.systemFontOfSize(10.0)
        self.synopsisLabel.numberOfLines = 5
        
        let posterRect = CGRect(
            x: 0,
            y: 0,
            width: MovieCell.posterWidth,
            height: MovieCell.posterHeight
        )
        
        self.posterView = UIImageView(frame: posterRect)
        self.posterView.alpha = 0.0

        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.synopsisLabel)
        self.contentView.addSubview(self.posterView)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.contentView.backgroundColor = UIColor.whiteColor()
        self.titleLabel.backgroundColor = UIColor.greenColor()
        self.synopsisLabel.backgroundColor = UIColor.orangeColor()
    }

}
