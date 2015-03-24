//
//  ViewController.swift
//  Unexpected-Journey
//
//  Created by Peter & Liz  on 3/12/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func signUp(sender: AnyObject) {
        
        self.performSegueWithIdentifier("signUpSplash", sender: "self")
    }
    
    @IBAction func login(sender: AnyObject) {
        
        self.performSegueWithIdentifier("loginSegueToSignIn", sender: "self")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

