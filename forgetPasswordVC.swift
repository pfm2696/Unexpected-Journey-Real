//
//  forgetPasswordVC.swift
//  Unexpected-Journey
//
//  Created by Peter & Liz  on 3/13/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

class forgetPasswordVC: UIViewController {
    
    @IBOutlet var emailInput: UITextField!
    @IBAction func submitButton(sender: AnyObject) {
        
        var initialEmail = emailInput.text
        var email = initialEmail.lowercaseString
        var finalEmail = email.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        PFUser.requestPasswordResetForEmailInBackground(finalEmail) { (success: Bool, error: NSError!) -> Void in
            if error == nil {
                var success = UIAlertController(title: "Success", message: "Success! Check your email!", preferredStyle: .Alert)
                var okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
                success.addAction(okButton)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.presentViewController(success, animated: false, completion: nil)
                })
            }else {
                var errormessage = error.userInfo!["error"] as NSString
                var error = UIAlertController(title: "Cannot complete request", message: errormessage, preferredStyle: .Alert)
                var okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
                error.addAction(okButton)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.presentViewController(error, animated: false, completion: nil)
                })
                
            }
        }

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
