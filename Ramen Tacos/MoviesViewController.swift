//
//  MoviesViewController.swift
//  Ramen Tacos
//
//  Created by Matt Hayes on 8/31/15.
//  Copyright (c) 2015 Mystery Command. All rights reserved.
//

import UIKit
import AFNetworking

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    
    var movies: [NSDictionary]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView = UITableView()
        self.tableView.frame = UIScreen.mainScreen().bounds
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.rowHeight = CGFloat(MovieCell.rowHeight)
        self.tableView.registerClass(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        
        self.view.addSubview(self.tableView)
        
        let url = NSURL(string: "https://gist.githubusercontent.com/timothy1ee/d1778ca5b944ed974db0/raw/489d812c7ceeec0ac15ab77bf7c47849f2d1eb2b/gistfile1.json")!
        let req = NSURLRequest(URL: url)

        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? NSDictionary
            if let json = json {
                self.movies = json["movies"] as! [NSDictionary]
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Movies"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = self.movies {
            return movies.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("MovieCell", forIndexPath: indexPath) as! MovieCell
        
        let movie = self.movies![indexPath.row]
        cell.titleLabel?.text = movie["title"] as? String
        cell.synopsisLabel?.text = movie["synopsis"] as? String
        cell.synopsisLabel?.sizeToFit()
        
        if let urlString = movie.valueForKeyPath("posters.thumbnail") as? String {
            let url = NSURL(string:  urlString)
            if let url = url {
                cell.posterView?.setImageWithURLRequest(
                    NSURLRequest(URL: url),
                    placeholderImage: nil,
                    success: { (request: NSURLRequest, response: NSHTTPURLResponse, image: UIImage) -> Void in
                        cell.posterView?.image = image
                        UIView.animateWithDuration(0.4, animations: {
                            cell.posterView?.alpha = 1.0
                        })
                    },
                    failure: { (request: NSURLRequest, response: NSHTTPURLResponse, error: NSError) -> Void in
                        println(error)
                    }
                )
            }
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath, tableView.indexPathForSelectedRow())
        let movie = self.movies?[indexPath.row]
        
        let detailsViewController = DetailsViewController()
        detailsViewController.movie = movie

        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }

}
