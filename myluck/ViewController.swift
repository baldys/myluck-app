//
//  ViewController.swift
//  myluck
//
//  Created by Chris on 2014-11-30.
//  Copyright (c) 2014 greenwood. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var topDoorBg: UIView!

    @IBOutlet weak var scoreLabel: UILabel!
    

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
            } else {
                startPanDoor = "bottom"
            }

        } else if(touch.state == UIGestureRecognizerState.Changed) {
            // Move the door in the direction of the swipe
            var changeX:CGFloat = touch.locationInView(self.view).x - startPanX
            
            
        

            var frame = topDoorBg.frame
            if(changeX > 0) {
                // Moving right
                frame.origin.x = changeX
            } else {
                // Moving left
                frame.origin.x = self.view.frame.size.width + changeX // changeX is negative
            }
            frame.origin.x += changeX
            println("setting frame to")
            println(frame.origin.x)
            
//            frame.origin.y = 0.0
            topDoorBg.frame = frame
            
            
            return
            
            
            

            
            
            var bounds = topDoorBg.bounds
            
            
            
            
            bounds.origin.x += changeX
            
            

            
            
            topDoorBg.bounds = bounds
            
            println(bounds.origin.x)
            
            //View.frame = CGRectOffset( aView.frame, 10, 10 );
            
            
//            topDoorBg.frame.offset(dx: -1.0, dy:-1.0)
//
//            
//            println(changeX)
//            
//            
//            println(topDoorBg.frame.origin)
            
            
            //println(topDoorBg.frame.origin.x)
//            topDoorBg.frame = CGRectOffset(topDoorBg.frame, changeX, 0)
            
//            println(".")
        } else if(touch.state == UIGestureRecognizerState.Ended) {
            var halfWidth = self.view.bounds.size.width / 2
            var distanceX = abs(touch.locationInView(self.view).x - startPanX)
            if(distanceX > halfWidth) {
                println("CHOICE LOCKED IN")
            } else {
                println("cancelled")
                
                var frame = topDoorBg.frame
                frame.origin.x = self.view.frame.size.width
                topDoorBg.frame = frame
                
            }

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
        
        // Set colours
        self.view.backgroundColor = colors.primaryLight
        scoreLabel.textColor = colors.primaryLight
        
        topDoorBg.backgroundColor = colors.primaryDark
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

