//
//  Game.swift
//  myluck
//
//  Created by Chris on 2014-12-07.
//  Copyright (c) 2014 greenwood. All rights reserved.
//

import Foundation


class Game {
    var player: User
    var correctDoor: NSString = ""

    
    init(player: User) {
        // Some shit
        self.player = player
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
        var correct = self.correctDoor
        self.hidePrize()
        
        if door == correct {
            self.player.win()
            return true
        } else {
            self.player.lose()
            return false
        }
    }
        

    
}