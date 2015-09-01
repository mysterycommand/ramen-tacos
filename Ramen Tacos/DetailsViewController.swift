//
//  DetailsViewController.swift
//  Ramen Tacos
//
//  Created by Matt Hayes on 8/31/15.
//  Copyright (c) 2015 Mystery Command. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
//    var posterView: UIImageView!
    var titleLabel: UILabel!
//    var synopsisLabel: UILabel!
    
    var movie: NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()

        let titleRect = CGRect(x: 10, y: 10, width: 310, height: 18)

        self.titleLabel = UILabel(frame: titleRect)
        self.titleLabel.backgroundColor = UIColor.magentaColor()
        self.titleLabel.font = UIFont.systemFontOfSize(15.0, weight: 0.3)

        self.view.addSubview(self.titleLabel)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.titleLabel.text = self.movie?["title"] as? String
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
}
