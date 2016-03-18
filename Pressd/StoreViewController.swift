//
//  StoreViewController.swift
//  Pressd
//
//  Created by Mike Rizza on 1/20/16.
//  Copyright © 2016 Mike Rizza. All rights reserved.
//

import UIKit
import Parse
import Bolts

class StoreViewController: UIViewController, UIPopoverPresentationControllerDelegate, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // code for popOver////////////////
    
    @IBAction func popOver(sender: AnyObject) {
        
        self.performSegueWithIdentifier("showPopOver", sender: self)
        
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showPopOver"
        {
            
            let vc = segue.destinationViewController 
            
            let controller = vc.popoverPresentationController
            
            if controller != nil
            {
                controller?.delegate = self
            }
            
        }else{
            
            //if segue is to go to storeitemviewcontroller
            if segue.identifier == "showStoreItem"
            {
                let indexPaths = self.storeCollectionView!.indexPathsForSelectedItems()!
                let indexPath = indexPaths[0] as NSIndexPath
                
                
                let vc = segue.destinationViewController as! StoreItemViewController
                
                vc.image = self.imageArray[indexPath.row]!
                vc.title = self.products[indexPath.row]
            }
            
        }
        
            
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        
        return .None
    }
    //////////////////////////
    
    
    // code for collectionView///////////
    @IBOutlet weak var storeCollectionView: UICollectionView!
    
    let products = ["Tee", "Hoodie", "Pressd"]
    
    let imageArray = [UIImage(named: "tee.png"), UIImage(named: "hoodie.png"), UIImage(named: "pressd.png")]
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.products.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("storeCell", forIndexPath: indexPath) as! StoreCollectionViewCell
        
        cell.storeImageView?.image = self.imageArray[indexPath.row]
        
        cell.storeLabel?.text = self.products[indexPath.row]
        
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        self.performSegueWithIdentifier("showStoreItem", sender: self)
    }
    
    
    
    
    
 /*  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if segue.identifier == "showStoreItem"
        {
            let indexPaths = self.storeCollectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            
            let vc = segue.destinationViewController as! StoreItemViewController
            
            vc.image = self.imageArray[indexPath.row]!
            vc.title = self.products[indexPath.row]
        }
        
    }*/
    

    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
