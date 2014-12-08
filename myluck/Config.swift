//
//  Config.swift
//  myluck
//
//  Created by Chris on 2014-12-07.
//  Copyright (c) 2014 greenwood. All rights reserved.
//

import Foundation
import UIKit



struct Config {
    // What's behind the door
    static var prize = "6"

    // Colors
    struct colors {
        static var primaryLight = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
        static var primaryDark = UIColor(red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.0)
        
        static var successLight = UIColor(red: 140/255.0, green: 198/255.0, blue: 63/255.0, alpha: 1.0)
        static var successDark = UIColor(red: 128/255.0, green: 178/255.0, blue: 50/255.0, alpha: 1.0)
        
        static var failLight = UIColor(red: 193/255.0, green: 39/255.0, blue: 45/255.0, alpha: 1.0)
        static var failDark = UIColor(red: 178/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0)
    }


    
}