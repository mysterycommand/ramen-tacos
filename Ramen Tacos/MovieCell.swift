//
//  MovieCellTableViewCell.swift
//  Ramen Tacos
//
//  Created by Matt Hayes on 8/31/15.
//  Copyright (c) 2015 Mystery Command. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    static let pad = 2
    static let posterWidth = 51
    static let posterHeight = 81

    static var rowWidth: Int {
        get { return MovieCell.pad + MovieCell.pad + MovieCell.posterWidth }
    }

    static var rowHeight: Int {
        get { return MovieCell.pad + MovieCell.pad + MovieCell.posterHeight }
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
            x: MovieCell.rowWidth,
            y: MovieCell.pad,
            width: appWidth - MovieCell.posterWidth - MovieCell.pad * 3,
            height: 15
        )

        self.titleLabel = UILabel(frame: titleRect)
        self.titleLabel.backgroundColor = UIColor.greenColor()
        self.titleLabel.font = UIFont.systemFontOfSize(13.0, weight: 0.8)
        
        let synopsisRect = CGRect(
            x: MovieCell.rowWidth,
            y: MovieCell.pad + MovieCell.pad + Int(titleRect.height),
            width: Int(titleRect.width),
            height: 81 - MovieCell.pad - Int(titleRect.height)
        )
        
        self.synopsisLabel = UILabel(frame: synopsisRect)
        self.synopsisLabel.backgroundColor = UIColor.orangeColor()
        self.synopsisLabel.font = UIFont.systemFontOfSize(11.0)
        self.synopsisLabel.numberOfLines = 4
        
        let posterRect = CGRect(
            x: MovieCell.pad,
            y: MovieCell.pad,
            width: MovieCell.posterWidth,
            height: MovieCell.posterHeight
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
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.contentView.backgroundColor = UIColor.whiteColor()
        self.titleLabel.backgroundColor = UIColor.greenColor()
        self.synopsisLabel.backgroundColor = UIColor.orangeColor()
    }

}
