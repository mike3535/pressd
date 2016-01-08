//
//  ViewController.swift
//  Ober
//
//  Created by Mike Rizza on 1/7/16.
//  Copyright © 2016 Mike Rizza. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    @IBOutlet var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setupView()
        
       
        }
        
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //setup to play video file
    func setupView() {
    
        let path = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("introVideo", ofType: "mov")!)
    
        let player = AVPlayer(URL: path)
    
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = self.videoView.frame
        self.videoView.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        //set text to play over video view
        self.oberTextCenter(self.videoView) // view we put text on
        
        player.play()
        
        // set it to do nothing when video ends
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.None
    
        //set notification when video ends
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "videoDidPlayToEnd:", name: "AVPlayerItemDidPlayToEndTimeNotification", object: player.currentItem)
        
        //add buttons to video view
        self.createOberButtons(self.videoView)
    
}
    //what to do when video ends
    func videoDidPlayToEnd(notification: NSNotification){
        
        
        //replay video when it ends
        let player: AVPlayerItem = notification.object as! AVPlayerItem
          player.seekToTime(kCMTimeZero)
        
       
        
        //create label
        //self.oberTextCenter(self.videoView)
        
        
    }
    
    //create and set label
    func oberTextCenter(containerView: UIView!){
        
        let half:CGFloat = 1.0 / 2.0
        
        //label
        let oberLabel = UILabel()
        
        //label properties
        oberLabel.text = "Da Bulls"
        oberLabel.font = UIFont(name: "Apple Color Emoji", size:  120.0)
        oberLabel.backgroundColor = UIColor.clearColor()
        oberLabel.textColor = UIColor.redColor() //color of text
        oberLabel.sizeToFit()
        oberLabel.textAlignment = NSTextAlignment.Center
        oberLabel.frame.origin.x = (containerView.frame.size.width - oberLabel.frame.size.width) * half
        oberLabel.frame.origin.y = (containerView.frame.size.height - oberLabel.frame.size.height) * half
        containerView.addSubview(oberLabel)
        
    }

    //create signin and register buttons
    func createOberButtons(containerView: UIView){
        
        let margin:CGFloat = 15.0
        let middleSpacing:CGFloat = 7.5
        
        let signIn = UIButton()  //sign in button
        
        //properties of sign in
        signIn.setTitle("signIn", forState: .Normal)
        signIn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        signIn.backgroundColor = UIColor.greenColor()
        signIn.frame.size.width = (((containerView.frame.size.width - signIn.frame.size.width) - (margin * 2)) / 2 - middleSpacing)
        signIn.frame.size.height = 40.0
        signIn.frame.origin.x = margin
        signIn.frame.origin.y = ((containerView.frame.size.height - signIn.frame.size.height) - 25)
        
        //add target
        signIn.addTarget(self, action: "signInButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(signIn)
        
        
        let register = UIButton()//sign in button
        
        //properties of sign in
        register.setTitle("Register", forState: .Normal)
        register.setTitleColor(UIColor.blackColor(), forState: .Normal)
        register.backgroundColor = UIColor.greenColor()
        register.frame.size.width = (((containerView.frame.size.width - register.frame.size.width) - (margin * 2)) / 2 - middleSpacing)
        register.frame.size.height = 40.0
        register.frame.origin.x = ((containerView.frame.size.width - register.frame.size.width) - margin)
        register.frame.origin.y = ((containerView.frame.size.height - register.frame.size.height) - 25)
        
        //add target
        register.addTarget(self, action: "registerButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(register)
        
        
    }
    
    
    //navigate to signUp view controller
    func signInButtonPressed(sender: UIButton!){
        
        //access mainStoryBoard
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpVC: SignUpViewController = storyBoard.instantiateViewControllerWithIdentifier("signUp") as! SignUpViewController
        
        let navigationController = UINavigationController(rootViewController: signUpVC)
        
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    
    func registerButtonPressed(sender: UIButton!){
        
        print("Register")
    }
    
}





