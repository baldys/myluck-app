//
//  ViewController.swift
//  myluck
//
//  Created by Chris on 2014-11-30.
//  Copyright (c) 2014 greenwood. All rights reserved.
//

import UIKit



class PersonalBestViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBAction func TapViewAction(sender: UITapGestureRecognizer) {
        
        self.backToGame()
    }
    
    // Shows personal best page
    func backToGame() {
        let viewController = self.storyboard?.instantiateViewControllerWithIdentifier("gameView") as UIViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.scoreLabel.text = String(game.personalBest)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

