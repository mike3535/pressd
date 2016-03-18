//
//  SignUpViewController.swift
//  Ober
//
//  Created by Mike Rizza on 1/7/16.
//  Copyright © 2016 Mike Rizza. All rights reserved.
//

import UIKit
import Parse
import Bolts

class SignUpViewController: UIViewController , UITextFieldDelegate {

    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var passwordCheck: UITextField!
    @IBOutlet weak var emailCheck: UITextField!
    
    
    @IBOutlet weak var riderDriverControl: UISegmentedControl!
    
    
    var buttonTitlePressed: String?
    var isSignIn: Bool!
    var isRider: Bool!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       // self.addBackground()
        
        self.determineSignInOrRegister()
        
        
        //code to remove keyboard
        self.username.delegate = self
        self.password.delegate = self
        self.email.delegate = self
        self.passwordCheck.delegate = self
        self.emailCheck.delegate = self
        
        
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func cancel(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
    
    
    @IBAction func done(sender: AnyObject) {
        
        
        if isSignIn == false{
            
            //Register  - Checks//////////////
            
            
            //check for matching email and password
            if self.email.text != self.emailCheck.text || self.password.text != self.passwordCheck.text{
                
                self.showAlert("Password or Email not matching", message: "Make sure Password and Email are both matching")
                
            }else{
                
                                            //make sure seg control has something selected
            if self.username.text == "" || self.password.text == "" || self.email.text == "" || self.emailCheck.text == "" ||  self.passwordCheck.text == ""  {
                
                
                if self.username.text == ""{
                    
                    //set textfield background color to red
                    self.username.backgroundColor = UIColor.redColor()
                    self.username.layer.borderWidth = 1.5
                    
                    
                    
                    
                }
                
                if self.password.text == ""{
                 
                    
                    self.password.backgroundColor = UIColor.redColor()
                    self.password.layer.borderWidth = 1.5
                    
                    
                }
                
                if self.email.text == ""{
                    
                    
                    self.email.backgroundColor = UIColor.redColor()
                    self.email.layer.borderWidth = 1.5
                    
                    
                }

                
                if self.emailCheck.text == ""{
                    
                    self.emailCheck.backgroundColor = UIColor.redColor()
                    self.emailCheck.layer.borderWidth = 1.5
                    
                }
                
                if self.passwordCheck.text == ""{
                    
                    self.passwordCheck.backgroundColor = UIColor.redColor()
                    self.passwordCheck.layer.borderWidth = 1.5
                    
                }
                
                
                
                self.showAlert("Missing Field Required", message: "Fill in or select missing field(s) in red")
                
                
            }else{
                
                //Registering from parse
                let user = PFUser()
                
                
                //rows you want in parse
                user.username = self.username.text
                user.password = self.password.text
                user.email = self.email.text
                
                
                
                
                //copy this from parse
                user.signUpInBackgroundWithBlock {
                    (succeeded: Bool, error: NSError?) -> Void in
                    if let error = error {
                        
                        let errorString = error.userInfo["error"] as? NSString
                        
                        
                        // Show the errorString somewhere and let the user try again.
                        self.showAlert("Error Registering", message: String(errorString))
                        
                        
                        
                    } else {
                        
                        print("Register Succeeded")
                        
                        
                        
                        // User needs to verify email address before continuing
                        let alertController = UIAlertController(title: "Email address verification",
                            message: "We have sent you an email that contains a link - you must click this link before you can continue.", preferredStyle: UIAlertControllerStyle.Alert)
                        
                        
                        alertController.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.Default, handler: { alertController in self.processSignOut()}))
                        
                        // Display alert
                        self.presentViewController(alertController, animated: true, completion: nil)
                        
                        
                        
                        
                        
                        
    
                    }
                }
                
                
                
                
            }
            
            
            
            
            
            }}else{
            
            //Sign In Code from parse
            
            PFUser.logInWithUsernameInBackground(self.username.text!, password:self.password.text!) {
                (user: PFUser?, error: NSError?) -> Void in
                
                //check there is such a user
                if (user) == nil {
                    
                    self.showAlert("Incorrect login information", message: "Check username and password")
                    
                }else{
               
                
                //check for verified emal
                if user?["emailVerified"] as! Bool == true {
                    
                    print("singIn success")
                    
                   // dispatch_async(dispatch_get_main_queue()) {
                    //    self.performSegueWithIdentifier("main", sender: self)
                   // }
                
                        
                    //if signin navagate to store
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let vC: StoreViewController = storyBoard.instantiateViewControllerWithIdentifier("store") as! StoreViewController
                        let navigationController = UINavigationController(rootViewController: vC)
                        self.presentViewController(navigationController, animated: true, completion: nil)
                    
                    
                    
                } else {
                   
                    
                    // User needs to verify email address before continuing
                    let alertController = UIAlertController(title: "Email address verification", message: "We have sent you an email that contains a link - you must click this link before you can continue.", preferredStyle: UIAlertControllerStyle.Alert)
                   
                    
                    alertController.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.Default, handler: { alertController in self.processSignOut()}))
                   
                    
                    // Display alert
                    self.presentViewController(alertController, animated: true,completion: nil)
                    
                    
                    
                        
                        
                    
                    
                   
                    
                    
                 
                    }
                    
                   
                }
            }
        }
    
    
        }
        
    
    
    
    
    
    
    func determineSignInOrRegister(){
        
        
        if buttonTitlePressed != nil{
            
            
            if buttonTitlePressed == "signIn" {
                
                
                isSignIn = true
                
                //change title of navigation controller
                self.navigationController!.topViewController!.title = "Sign In"
                
                
                //Hide riderDriverControl
                self.email.hidden = true
                self.emailCheck.hidden = true
                self.passwordCheck.hidden = true
                
                print(isSignIn)
                
            }
        }else{
            
            isSignIn = false
            
            //change title of navigation controller to register screen
                self.navigationController!.topViewController!.title = "Register"
            
           
            
            
            print("Register")
            
            print(isSignIn)
        }
        
        
        
        
        
    }
    
    
    
    
    
 /*   @IBAction func riderDriver(sender: UISegmentedControl) {
        
        
        //if segment index is rider
        if self.riderDriverControl.selectedSegmentIndex == 0 {
            
            self.isRider = true
            
            print(isRider)
            
        }else{
            
            self.isRider = false
            
            print(isRider)
        }
        
        
        
        
        
    }*/
    
    
    
    
    
    //show alert
    func showAlert(title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    
    
    //function to add background
    
    func addBackground() {
        // screen width and height:
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
        imageViewBackground.image = UIImage(named: "bg.png")
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.view.addSubview(imageViewBackground)
        self.view.sendSubviewToBack(imageViewBackground)
        
    }
    
    
    // Sign the current user out of the app
    func processSignOut() {
        
        
        
        
        // // Sign out
        PFUser.logOut()
        
        // Display sign in / up view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //go back to cover page
        let vc = storyboard.instantiateViewControllerWithIdentifier("cover")
        
        //let navigationController = UINavigationController(rootViewController: vc)
        
        self.presentViewController(vc, animated: true, completion: nil)
        

        
        
    }
    
    
    //function to remove keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
