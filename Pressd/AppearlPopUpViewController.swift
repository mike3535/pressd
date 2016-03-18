//
//  AppearlPopUpViewController.swift
//  Pressd
//
//  Created by Mike Rizza on 1/21/16.
//  Copyright © 2016 Mike Rizza. All rights reserved.
//

import UIKit


class AppearlPopUpViewController: UIViewController, UITextViewDelegate, UIPopoverControllerDelegate, UIPopoverPresentationControllerDelegate{
    
  var text: String?
 
    
    
    @IBOutlet weak var descLabel: UILabel!
    
    var myDescLabel = ""
    
    
   
    override func viewWillAppear(animated: Bool) {

        
        descLabel.text = myDescLabel
                
       // descTextView.textColor = UIColor.redColor()
        // descTextView.font =  UIFont(name: "ded", size: 40)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
       // descTextView.textColor = UIColor.redColor()
       // descTextView.font =  UIFont(name: "ded", size: 40)
        
       
        
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
