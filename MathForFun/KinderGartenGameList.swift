//
//  GameList.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/5/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

struct KinderGartenGameList {
        
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

        var name: String {
            self.rawValue
        }
        
        var hasLimitSelections: Bool {
            guard limitSelections != nil else {
                return false
            }
            return true
            
        }
        
        // limit selections are different selections that user can choose to get maximum limit of number of items in a single problem
        // identifying color and identifying shape returns nil because there is always one item in the problem which is the shape or color user have to guess
        var limitSelections: [Int]? {
            
            switch self {
            case .counting:
                return [3, 5, 10, 15, 20, 30]
            case .comparing:
                return [3, 5, 10]
            default:
                return nil
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
