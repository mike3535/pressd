//
//  PopUpViewController.swift
//  Pressd
//
//  Created by Mike Rizza on 1/20/16.
//  Copyright © 2016 Mike Rizza. All rights reserved.
//

import UIKit
import Parse
import Bolts


class PopUpViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logOut(sender: AnyObject) {
        
    
            
            
            
            // // Sign out
            PFUser.logOut()
            
            // Display sign in / up view controller
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            //go back to cover page
            let vc = storyboard.instantiateViewControllerWithIdentifier("cover")

            
            self.presentViewController(vc, animated: true, completion: nil)
            
            
            
            
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
