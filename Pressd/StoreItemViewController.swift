//
//  StoreItemViewController.swift
//  Pressd
//
//  Created by Mike Rizza on 1/21/16.
//  Copyright © 2016 Mike Rizza. All rights reserved.
//

import UIKit

class StoreItemViewController: UIViewController, UIPopoverPresentationControllerDelegate  {
    
    ///////////////
    
    
    
    @IBOutlet weak var storeItemImageView: UIImageView!
    
    var image = UIImage()
    
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    var popOverString: String = ""
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.storeItemImageView.image = self.image
        
        setLabels()
        getDesc()
        
        
        
       
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    
    
 /*   func popoverPresentationControllerDidDismissPopover(popoverPresentationController: UIPopoverPresentationController) {
        getDesc()
        
    }*/
    
    
    
   
     // code for popOver////////////////
    @IBAction func desPopOver(sender: AnyObject) {
        
        self.performSegueWithIdentifier("appearlPopOver", sender: self)
        
        
    }
    
 

    
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "appearlPopOver"
        {
            
            let vc = segue.destinationViewController as! AppearlPopUpViewController
            
            
          vc.myDescLabel = popOverString
            
           let controller = vc.popoverPresentationController
            
           
            
            
            if controller != nil
                
            {
                
                
               controller?.delegate = self
                
               
            }

    
        }
    
    }
    
    
    
   func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        
       return .None
    }
    //////////////////
    
    
    
    
    
    
    //get the item name label from nsuserdefaults and match with correct description
    func getDesc(){
        
        
        
        if itemNameLabel.text == "Pressd Staple Logo Tee"{
            
            popOverString = "You saw it first at the Pressd Kickstarter campagin, and we have no plans of ever getting rid of it. This black ink on black tri-blend American Apparel Track Shirt is our favorite every day all day shirt."
            
        }
        
        if itemNameLabel.text == "Pressd Staple Zip-Hoodie"{
            
            popOverString = "The hoodie largely responsible for funding the Pressd Kickstarter campagin. This black ink on black lightweight American Apparel Jersey Hoodie quickly became a Pressd staple! It's a perfect light weight zip up hoodie you can wear year round."
            
            
            
        }
        
        if itemNameLabel.text == "Example"{
            
            popOverString = "Example Example Example Example Example"
            
            
        }
        
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    func setLabels(){
        
        if storeItemImageView.image == UIImage(named: "tee.png"){
            
            itemNameLabel.text = "Pressd Staple Logo Tee"
            priceLabel.text = "$15.00"
            
        }
        
        if storeItemImageView.image == UIImage(named: "hoodie.png"){
            
            itemNameLabel.text = "Pressd Staple Zip-Hoodie"
            priceLabel.text = "$25.00"
            
            
        }
        
        if storeItemImageView.image == UIImage(named: "pressd.png"){
            
            itemNameLabel.text = "Example"
            priceLabel.text = "$00.00"
            
            
        }
        
        
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
