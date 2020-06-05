//
//  GameModel.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation



struct ExerciseSession {
    
    var problems: [Problem]
    
    var index = 0
    
    var score = 0
    
    var gameCompleted = false
    
    enum Problem {
        case counting
        case comparing
        case identifyingColor
        case identifyingShape
    }
    
}
