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
      //  self.oberTextCenter(self.videoView) // view we put text on
        
        player.play()
        
        // set it to do nothing when video ends
        player.actionAtItemEnd = AVPlayerActionAtItemEnd.None
    
        //set notification when video ends
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "videoDidPlayToEnd:", name: "AVPlayerItemDidPlayToEndTimeNotification", object: player.currentItem)
    
}
    //what to do when video ends
    func videoDidPlayToEnd(notification: NSNotification){
        
        
        //replay video when it ends
        /*let player: AVPlayerItem = notification.object as! AVPlayerItem
          player.seekToTime(kCMTimeZero)*/
        
       
        
        //create label
        self.oberTextCenter(self.videoView)
        
        
    }
    
    //create and set label
    func oberTextCenter(containerView: UIView!){
        
        let half:CGFloat = 1.0 / 2.0
        
        //label
        let oberLabel = UILabel()
        
        //label attributes
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

}





