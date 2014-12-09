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
    
    // Shows personal best page
    func showPersonalBestPage() {
        let personalBestViewController = self.storyboard?.instantiateViewControllerWithIdentifier("personalBest") as PersonalBestViewController
        self.navigationController?.pushViewController(personalBestViewController, animated: true)
    }
    
    
    
    @IBAction func TapAction(tap: UITapGestureRecognizer) {
        closeDoors()
        
        var location = tap.locationInView(self.view)
        var halfHeight = self.view.frame.size.height / 2
        
        if(location.y < halfHeight) {
            makeChoice("top")
            topDoorBg.hidden = false
        } else {
            makeChoice("bottom")
            bottomDoorBg.hidden = false
        }
    }

    
    func handleSwipe(swipe: UISwipeGestureRecognizer) {
        closeDoors()
        
        println(swipe.direction)
        var location = swipe.locationInView(self.view)
        var halfHeight = self.view.frame.size.height / 2
        
        if(location.y < halfHeight) {
            makeChoice("top")
            topDoorBg.hidden = false
        } else {
            makeChoice("bottom")
            bottomDoorBg.hidden = false
        }
    }
    
    
    @IBAction func swipeLeftAction(sender: UISwipeGestureRecognizer) {
        self.handleSwipe(sender)
    }
    @IBAction func SwipeRightAction(sender: UISwipeGestureRecognizer) {
        self.handleSwipe(sender)
    }
    
//    @IBAction func PanGestureAction(touch: UIPanGestureRecognizer) {
//        if(touch.state == UIGestureRecognizerState.Began) {
//            
//            println("Started")
//            closeDoors()
//
//            
//            var location = touch.locationInView(self.view)
//            startPanX = location.x
//            startPanY = location.y
//            var halfHeight = self.view.frame.size.height / 2
//            
//            if(startPanY < halfHeight) {
//                startPanDoor = "top"
//                topDoorBg.hidden = false
//            } else {
//                startPanDoor = "bottom"
//                bottomDoorBg.hidden = false
//            }
//
//        } else if(touch.state == UIGestureRecognizerState.Changed) {
//            // Move the door in the direction of the swipe
//            var changeX:CGFloat = touch.locationInView(self.view).x - startPanX
//            
//            var targetFrame = startPanDoor == "top" ? topDoorBg : bottomDoorBg
//            var frame = targetFrame.frame
//            if(changeX > 0) {
//                // Moving right
//                frame.origin.x = changeX - targetFrame.frame.size.width
//            } else {
//                // Moving left
//                frame.origin.x = self.view.frame.size.width + changeX // changeX is negative
//            }
//            targetFrame.frame = frame
//            
//
//        } else if(touch.state == UIGestureRecognizerState.Ended) {
//            var lockInDistance = Double(self.view.bounds.size.width) * panThreshold
//            var distanceX = Double(abs(touch.locationInView(self.view).x - startPanX))
//            if(distanceX < lockInDistance) {
//                // Cancelled choice
//                println("Cancelled")
//                closeDoors()
//            } else {
//
//                self.makeChoice(self.startPanDoor)
//                
//            } // end if distane travelled is enough
//        } // end touch state
//    }
    
    

    // =========== CHOICE IS MADE ===========
    func makeChoice(choice:NSString) {
        

        println("CHOICE LOCKED IN for \(choice)")
        var answeredRight = game.choose(choice)
        println("right: \(answeredRight)")
        
        // Move the background to be full width
        var targetFrame = choice == "top" ? topDoorBg : bottomDoorBg
        var frame = targetFrame.frame
        frame.origin.x = 0
        targetFrame.frame = frame
        
        
        // Success or failure?
        if answeredRight {
            // Reveal the prize
            if choice == "top" {
                topPrizeLabel.hidden = false
            } else {
                bottomPrizeLabel.hidden = false
            }
            
        } else {
            // wrong
            
            if user.newPersonalBest {
                self.showPersonalBestPage()
            }
            
        }
        
        // Update score!
        self.scoreLabel.text = String(user.streak)
        
        
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

