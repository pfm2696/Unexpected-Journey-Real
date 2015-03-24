//
//  logInVC.swift
//  Unexpected-Journey
//
//  Created by Peter & Liz  on 3/12/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

class logInVC: UIViewController {
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func displayAlert(title:String, error:String) {
        
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func signInBack(sender: AnyObject) {
        
        self.performSegueWithIdentifier("signInBack", sender: "self")
    }
    
    @IBAction func forgotPassword(sender: AnyObject) {
    
        self.performSegueWithIdentifier("forgotPasswordSegue", sender: "self")

    }
    
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBAction func logIn(sender: AnyObject){
        
        var error = ""
        
        if username.text == "" || password.text == "" {
            
            error = "Please enter a username and password"
            
        }
        
        if error != "" {
            
            displayAlert("Error In Form", error: error)
            
        } else {
            
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            PFUser.logInWithUsernameInBackground(username.text, password:password.text) {
                (user: PFUser!, logInError: NSError!) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if logInError == nil {
                    
                    println("Logged In")
                    self.performSegueWithIdentifier("logInToMainSegue", sender: "self")
                    
                } else {
                    
                    if let errorString = logInError.userInfo?["Error"] as? NSString {

                        error = errorString as String
                        
                    } else {
                        
                        error = "Please try again later."
                    }
                }
                
            }
            
                self.displayAlert("Could Not Log In", error: error)
        }
        
    }
        
        

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
                println(PFUser.currentUser())
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
      override func viewDidAppear(animated: Bool) {
        
        if PFUser.currentUser() != nil {
            
            self.performSegueWithIdentifier("logInToMainSegue", sender: self)
        }
        
    }

    
}
