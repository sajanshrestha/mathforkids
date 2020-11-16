//
//  GameList.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

struct GameList {
        
    var games: [Game] {
        Game.allCases
    }
    
    enum Game: String, CaseIterable, Identifiable {
        case counting = "Counting"
        case comparing = "Comparing"
        case identifyingObjects = "Identifying Creatures and Objects"
        case identifyingColor = "Identifying Colors"
        case identifyingShape = "Identifying Shapes"
        case position = "Positions"
        case classifying = "Classifying"
        case addition = "Addition"
        case subtraction = "Subtraction"
        case multiplication = "Multiplication"
        case division = "Division"

        var name: String {
            self.rawValue
        }
        
        var id: String {
            self.rawValue
        }
        
        var numberOfLevels: Int {
            switch self {
            case .counting: return 5
            case .comparing: return 7
            case .identifyingColor: return 5
            case .identifyingShape: return 5
            case .position: return 3
            case .classifying: return 5
            case .addition, .multiplication, .subtraction, .division: return 8
            case .identifyingObjects: return 7
            }
        }
    }
}
