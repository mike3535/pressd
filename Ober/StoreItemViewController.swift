//
//  StoreItemViewController.swift
//  Pressd
//
//  Created by Mike Rizza on 1/21/16.
//  Copyright © 2016 Mike Rizza. All rights reserved.
//

import UIKit

class StoreItemViewController: UIViewController {
    
    
    @IBOutlet weak var storeItemImageView: UIImageView!
    
    var image = UIImage()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.storeItemImageView.image = self.image
        
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
