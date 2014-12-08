//
//  Game.swift
//  myluck
//
//  Created by Chris on 2014-12-07.
//  Copyright (c) 2014 greenwood. All rights reserved.
//

import Foundation



class Game {
    var streak: Int = 0             // current turn
    var personalBest: Int = 0       // all time
    var newPersonalBest: Bool = false        // whether the last turn was a personal best

    var correctDoor: NSString = ""

    
    init() {
        // Some shit
        self.hidePrize()
    }
    
    // Sets self.correctDoor randomly
    private func hidePrize() {
        var doorNum = Int(arc4random_uniform(UInt32(2)))
        self.correctDoor = doorNum == 0 ? "top" : "bottom"
    }
    
    
    // Player is picking a door
    // @return bool right or wrong
    func choose(door:NSString) -> Bool {
        if door == self.correctDoor {
            self.answeredCorrect()
            return true
        } else {
            self.gameOver()
            return false
        }
    }
    
    // Player wins
    private func answeredCorrect() {
        self.streak += 1
        self.hidePrize()
    }
    
    // Player looses
    private func gameOver() {
        if self.streak > self.personalBest {
            self.personalBest = self.streak
            self.newPersonalBest = true
        } else {
            self.newPersonalBest = false
        }

        self.streak = 0
        self.hidePrize()
    }
    


    
    
    
    
    
}