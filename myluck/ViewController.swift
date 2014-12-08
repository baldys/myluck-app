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
    
    
    // Reset UI and update it to match current game state
    func resetUI() {
        // Setup colors
        self.view.backgroundColor = Config.colors.primaryLight
        scoreLabel.textColor = Config.colors.primaryLight
        topDoorBg.backgroundColor = Config.colors.primaryDark
        bottomDoorBg.backgroundColor = Config.colors.primaryDark
        

        // Move door backgrounds out of view and hide them
        var frame = topDoorBg.frame
        frame.origin.x = self.view.frame.width * 2
        topDoorBg.frame = frame
        topDoorBg.hidden = true
        
        var frame2 = bottomDoorBg.frame
        frame2.origin.x = self.view.frame.width * 2
        bottomDoorBg.frame = frame2
        bottomDoorBg.hidden = true
        
        scoreLabel.text = String(game.streak)
    }
    

    

    // Pan has started. aka choosing a side, top or bottom.
    // http://stackoverflow.com/questions/6614043/drag-view-from-the-point-you-touch-it-iphone
    var startPanX:CGFloat = 0
    var startPanY:CGFloat = 0
    var startPanDoor = ""
    @IBAction func PanGestureAction(touch: UIPanGestureRecognizer) {
        if(touch.state == UIGestureRecognizerState.Began) {
            
            //            CGPoint location = [touch locationInView:self.view];
            //            startX = location.x - ViewMain.center.x;
            //            startY = ViewMain.center.y;
            
            println("Started");
            
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
            if(distanceX >= lockInDistance) {
                println("CHOICE LOCKED IN")
                var answeredRight = game.choose(self.startPanDoor)
            } else {
                println("Cancelled")
            }
            
            resetUI()
        }
        
    }
    
    
    // Listen for swipes left or right
    @IBAction func SwipeLeftAction(sender: UISwipeGestureRecognizer) {
        println("Swiped left")
        println(sender)
    }
    
    @IBAction func SwipeRightAction(sender: UISwipeGestureRecognizer) {
        println("Swiped Right")
        println(sender.locationInView(sender.view))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetUI()
        

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

