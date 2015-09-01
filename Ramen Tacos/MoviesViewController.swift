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
        self.tableView.frame = UIScreen.mainScreen().applicationFrame
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.rowHeight = 90
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
        
        if let urlString = movie.valueForKeyPath("posters.thumbnail") as? String {
            println(urlString)
            let url = NSURL(string:  urlString)
            if let url = url {
                cell.posterView?.setImageWithURL(url)
            }
        }
        
        return cell
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
