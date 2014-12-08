//
//  ViewController.swift
//  myluck
//
//  Created by Chris on 2014-11-30.
//  Copyright (c) 2014 greenwood. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var panThreshold = 0.6 // how far the slide must go for it to lock in the answer
    
    @IBOutlet weak var topDoorBg: UIView!
    @IBOutlet weak var bottomDoorBg: UIView!

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var bottomPrizeLabel: UILabel!
    @IBOutlet weak var topPrizeLabel: UILabel!
    
    
    // Updates game config to match settings
    func initConfig() {
        // Setup colors
        self.view.backgroundColor = Config.colors.primaryLight
        scoreLabel.textColor = Config.colors.primaryLight
        topDoorBg.backgroundColor = Config.colors.primaryDark
        bottomDoorBg.backgroundColor = Config.colors.primaryDark
        
        // Set prize 
        bottomPrizeLabel.text = Config.prize
        topPrizeLabel.text = Config.prize
    }
    
    
    // Close the doors and hide the prize
    func closeDoors() {
        println("Closing the doors...")
        // Move door backgrounds out of view and hide them
        var frame = topDoorBg.frame
        frame.origin.x = self.view.frame.width * 2
        topDoorBg.frame = frame
        topDoorBg.hidden = true
        
        var frame2 = bottomDoorBg.frame
        frame2.origin.x = self.view.frame.width * 2
        bottomDoorBg.frame = frame2
        bottomDoorBg.hidden = true
        
        bottomPrizeLabel.hidden = true
        topPrizeLabel.hidden = true
    }
    

    

    // Pan has started. aka choosing a side, top or bottom.
    // http://stackoverflow.com/questions/6614043/drag-view-from-the-point-you-touch-it-iphone
    var startPanX:CGFloat = 0
    var startPanY:CGFloat = 0
    var startPanDoor = ""
    @IBAction func PanGestureAction(touch: UIPanGestureRecognizer) {
        if(touch.state == UIGestureRecognizerState.Began) {
            
            println("Started")
            closeDoors()

            
            var location = touch.locationInView(self.view)
            startPanX = location.x
            startPanY = location.y
            var halfHeight = self.view.frame.size.height / 2
            
            if(startPanY < halfHeight) {
                startPanDoor = "top"
                topDoorBg.hidden = false
            } else {
                startPanDoor = "bottom"
                bottomDoorBg.hidden = false
            }

        } else if(touch.state == UIGestureRecognizerState.Changed) {
            // Move the door in the direction of the swipe
            var changeX:CGFloat = touch.locationInView(self.view).x - startPanX
            
            var targetFrame = startPanDoor == "top" ? topDoorBg : bottomDoorBg
            var frame = targetFrame.frame
            if(changeX > 0) {
                // Moving right
                frame.origin.x = changeX - targetFrame.frame.size.width
            } else {
                // Moving left
                frame.origin.x = self.view.frame.size.width + changeX // changeX is negative
            }
            targetFrame.frame = frame
            

        } else if(touch.state == UIGestureRecognizerState.Ended) {
            var lockInDistance = Double(self.view.bounds.size.width) * panThreshold
            var distanceX = Double(abs(touch.locationInView(self.view).x - startPanX))
            if(distanceX < lockInDistance) {
                // Cancelled choice
                println("Cancelled")
                closeDoors()
            } else {

                // =========== CHOICE IS MADE ===========
                println("CHOICE LOCKED IN for \(startPanDoor)")
                var answeredRight = game.choose(self.startPanDoor)
                println("right: \(answeredRight)")
                
                // Move the background to be full width
                var targetFrame = startPanDoor == "top" ? topDoorBg : bottomDoorBg
                var frame = targetFrame.frame
                frame.origin.x = 0
                targetFrame.frame = frame
                
                
                // Success or failure?
                if answeredRight {
                    // Reveal the prize
                    if startPanDoor == "top" {
                        topPrizeLabel.hidden = false
                    } else {
                        bottomPrizeLabel.hidden = false
                    }
                } else {
                    // wrong
                    
                }
                
                
                // Update score!
                self.scoreLabel.text = String(game.streak)
                
            } // end if distane travelled is enough
        } // end touch state
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        initConfig()
        closeDoors()

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

