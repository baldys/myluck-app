//
//  Game.swift
//  myluck
//
//  Created by Chris on 2014-12-07.
//  Copyright (c) 2014 greenwood. All rights reserved.
//

import Foundation


class Game {
    var streak: Int = 0
    var topStreak: Int = 0
    var correctDoor: NSString = ""
    
    
    
    init() {
        self.correctDoor = self.randomDoor()
        
    }
    
    // Returns a string: "top" or "bottom"
    func randomDoor() -> NSString {
        var doorNum = Int(arc4random_uniform(UInt32(2)))
        return doorNum == 0 ? "top" : "bottom"
    }
    
    // Player is picking a door
    // @return bool right or wrong
    func choose(door:NSString) -> Bool {
        if door == self.correctDoor {
            self.answeredCorrect()
            return true
        } else {
            self.answeredWrong()
            return false
        }
    }
    
    // Player wins
    func answeredCorrect() {
        self.streak += 1
        
        self.correctDoor = self.randomDoor()
    }
    
    // Player looses
    func answeredWrong() {
        self.streak = 0
        
        self.correctDoor = self.randomDoor()
    }
    

    
    
    
    
    
}