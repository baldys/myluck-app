//
//  ViewController.swift
//  myluck
//
//  Created by Chris on 2014-11-30.
//  Copyright (c) 2014 greenwood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

