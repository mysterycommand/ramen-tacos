//
//  DetailsViewController.swift
//  Ramen Tacos
//
//  Created by Matt Hayes on 8/31/15.
//  Copyright (c) 2015 Mystery Command. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var posterView: UIImageView!
    var titleLabel: UILabel!
//    var synopsisLabel: UILabel!
    
    var movie: NSDictionary? {
        didSet {
            self.title = self.movie?["title"] as? String
            self.titleLabel?.text = self.movie?["title"] as? String
            
            if let urlString = self.movie?.valueForKeyPath("posters.thumbnail") as? String {
                if let url = NSURL(string: urlString) {
                    self.posterView?.setImageWithURL(url)
                }
            }
            
            self.setPoster()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()

        let titleRect = CGRect(x: 10, y: 10, width: 310, height: 18)

        self.titleLabel = UILabel(frame: titleRect)
        self.titleLabel.backgroundColor = UIColor.magentaColor()
        self.titleLabel.font = UIFont.systemFontOfSize(15.0, weight: 0.3)
        
        let posterRect = UIScreen.mainScreen().bounds
        
        self.posterView = UIImageView()
        self.posterView.frame = posterRect

        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.posterView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPoster() {
        if var urlString = self.movie?.valueForKeyPath("posters.detailed") as? String {
            
            var range = urlString.rangeOfString(".*cloudfront.net/", options: .RegularExpressionSearch)
            if let range = range {
                urlString = urlString.stringByReplacingCharactersInRange(range, withString: "https://content6.flixster.com/")
            }

            let url = NSURL(string:  urlString)

            if let url = url {
                self.posterView?.setImageWithURLRequest(
                    NSURLRequest(
                        URL: url,
                        cachePolicy: NSURLRequestCachePolicy.ReturnCacheDataElseLoad,
                        timeoutInterval: NSTimeInterval.abs(1.0)
                    ),
                    placeholderImage: nil,
                    success: { (request: NSURLRequest, response: NSHTTPURLResponse, image: UIImage) -> Void in
                        self.posterView?.image = image
                    },
                    failure: { (request: NSURLRequest, response: NSHTTPURLResponse, error: NSError) -> Void in
                        println(error)
                    }
                )
            }
        }
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
