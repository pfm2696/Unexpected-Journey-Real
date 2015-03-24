//
//  ContactUsVC.swift
//  Unexpected-Journey
//
//  Created by Peter & Liz  on 3/23/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit
import MessageUI

class ContactUsVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    var myMail: MFMailComposeViewController!
    
    @IBAction func sendEmail(sender: AnyObject) {
        
        var emailTitle = "Contact UXJ"
        var messageBody = "Thank you for sending us an email"
        var toRecipents = ["pfm2696@gmail.com"]
        var mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(emailTitle)
        mc.setMessageBody(messageBody, isHTML: false)
        mc.setToRecipients(toRecipents)
        
        self.presentViewController(mc, animated: true, completion: nil)
    }

    @IBAction func reportProblem(sender: AnyObject) {
        
        var emailTitle = "Report a Problem"
        var messageBody = "I had a problem with the UXJ App..."
        var toRecipents = ["pfm2696@gmail.com"]
        var mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(emailTitle)
        mc.setMessageBody(messageBody, isHTML: false)
        mc.setToRecipients(toRecipents)
        
        self.presentViewController(mc, animated: true, completion: nil)
        
    }
    
    @IBAction func youtube(sender: AnyObject) {
        
        if let url = NSURL(string: "") {
            UIApplication.sharedApplication().openURL(url)
        }
        
    }
    
    @IBAction func instagram(sender: AnyObject) {
        
        if let url = NSURL(string: "") {
            UIApplication.sharedApplication().openURL(url)
        }
        
    }

    @IBAction func twitter(sender: AnyObject) {
        
        if let url = NSURL(string: "") {
            UIApplication.sharedApplication().openURL(url)
        }

    }
    
    @IBAction func facebook(sender: AnyObject) {
        if let url = NSURL(string: "") {
            UIApplication.sharedApplication().openURL(url)
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
    
    func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError) {
        switch result.value {
        case MFMailComposeResultCancelled.value:
            println("Mail cancelled")
        case MFMailComposeResultSaved.value:
            println("Mail saved")
        case MFMailComposeResultSent.value:
            println("Mail sent")
        case MFMailComposeResultFailed.value:
            println("Mail sent failure: \(error.localizedDescription)")
        default:
            break
        }
        self.dismissViewControllerAnimated(false, completion: nil)
    }
}