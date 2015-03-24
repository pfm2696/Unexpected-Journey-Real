//
//  signUp.swift
//  Unexpected-Journey
//
//  Created by Peter & Liz  on 3/12/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

var user = PFUser()

class signUp: UIViewController {
    
    
    @IBAction func fbsu(sender: AnyObject) {
    
        var permissions = ["public_profile"]
        
        
        PFFacebookUtils.logInWithPermissions(permissions, block: {
            (user: PFUser!, error: NSError!) -> Void in
            if user == nil {
                NSLog("Uh oh. The user cancelled the Facebook login.")
            } else if user.isNew {
                NSLog("User signed up and logged in through Facebook!")
            } else {
                NSLog("User logged in through Facebook!")
            }
        })
    
    }
    
    
    
    @IBAction func signUpBack(sender: AnyObject) {
        
        self.performSegueWithIdentifier("signUpBack", sender: "self")
    }
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func displayAlert(title:String, error:String) {
        
        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var age: UITextField!
    @IBOutlet var gender: UITextField!
    @IBOutlet var location: UITextField!
    
    @IBOutlet var username: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
   
    @IBAction func signUpButton(sender: AnyObject) {
        
        var error = ""
        
        if username.text == "" || password.text == "" {
            
            error = "Please enter a valid username and password"
            
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
            
            user.username = username.text
            user.password = password.text
            user.email = email.text
            user["firstName"] = firstName.text
            user["lastName"] = lastName.text
            user["gender"] = gender.text
            user["location"] = location.text
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool!, signupError: NSError!) -> Void in
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if signupError == nil  {
                    // Hooray! Let them use the app now.
                    println("signed up")
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                    self.performSegueWithIdentifier("segueSignUp", sender: "self")
                    
                } else {
                    if let errorString = signupError.userInfo?["error"] as? NSString {
                        
                        // Update - added as! String
                        
                        error = errorString as String
                        
                    } else {
                        
                        error = "Please try again later."
                        
                    }
                    
                    self.displayAlert("Could Not Sign Up", error: error)
                }
                
            }
            
        }

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
