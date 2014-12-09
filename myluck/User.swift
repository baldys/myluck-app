//
//  User.swift
//  myluck
//
//  Created by Chris on 2014-12-07.
//  Copyright (c) 2014 greenwood. All rights reserved.
//

import Foundation



class User {
    var streak: Int = 0             // current turn
    var personalBest: Int = 0       // all time
    var newPersonalBest: Bool = false        // whether the last turn was a personal best

    
    init() {
    }
    

    
    func win() {
        self.streak += 1
    }
    
    func lose() {
        if self.streak > self.personalBest {
            self.personalBest = self.streak
            self.newPersonalBest = true
        } else {
            self.newPersonalBest = false
        }
        
        self.streak = 0
    }
}