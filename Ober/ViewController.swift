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
    
    player.play()
    
    
}


}





