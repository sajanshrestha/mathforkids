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
        getGames()
    }
    
    struct Game: Identifiable {
        var id: Int
        var gameType: GameType
    }
    
    enum GameType: String, CaseIterable {
        
        case counting = "Counting"
        case comparing = "Comparing"
        case identifyingColor = "Identifying Color"
        case identifyingShape = "Identifying Shape"
        case position = "Positions"
        case classifying = "Classifying"
        case addition = "Addition"
        case subtraction = "Subtraction"
        case multiplication = "Multiplication"
        case division = "Division"

        var name: String {
            self.rawValue
        }
        
        var numberOfLevels: Int {
            switch self {
            case .counting: return 5
            case .comparing: return 6
            case .identifyingColor: return 3
            case .identifyingShape: return 2
            case .position: return 3
            case .classifying: return 5
            case .addition, .multiplication, .subtraction, .division: return 8
            }
        }
    }
    
    private func getGames() -> [Game] {
        
        var games = [Game]()
        
        var id = 0
        
        for gameType in GameType.allCases {
            games.append(Game(id: id, gameType: gameType))
            id += 1
        }
        
        return games
    }
}
