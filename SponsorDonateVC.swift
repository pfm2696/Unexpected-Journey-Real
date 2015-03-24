//
//  SponsorDonateVC.swift
//  Unexpected-Journey
//
//  Created by Peter & Liz  on 3/23/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

class SponsorDonateVC: UIViewController {
    
    @IBAction func donateButton(sender: AnyObject) {
        if let url = NSURL(string: "https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=pfm2696%40gmail%2ecom&lc=US&item_name=The%20Unexpected%20Journey&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted") {
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
    
}
