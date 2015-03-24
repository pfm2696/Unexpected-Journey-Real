//
//  ProfileVC.swift
//  Unexpected-Journey
//
//  Created by Peter & Liz  on 3/23/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBAction func post(sender: AnyObject) {
        
    }
    @IBAction func logOut(sender: AnyObject) {
        PFUser.logOut()
    }
    
    @IBOutlet var first: UILabel!
    @IBOutlet var last: UILabel!
    @IBOutlet var age: UILabel!
    @IBOutlet var gender: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var profilePic: UIImageView!
    
    @IBAction func uploadPic(sender: AnyObject) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
