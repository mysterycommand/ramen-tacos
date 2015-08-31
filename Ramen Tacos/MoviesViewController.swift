//
//  MoviesViewController.swift
//  Ramen Tacos
//
//  Created by Matt Hayes on 8/31/15.
//  Copyright (c) 2015 Mystery Command. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    var tf: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tf = UITextField(frame: CGRect(x: 10.0, y: 30.0, width: 300.0, height: 30.0))
        self.tf.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(self.tf)
        
        println(self.view.subviews)

        // Do any additional setup after loading the view.
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
