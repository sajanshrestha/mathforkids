//
//  PlayerLevel.swift
//  MathForFun
//
//  Created by Sajan Shrestha on 6/20/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import Foundation

enum LevelStatus {
    case none
    case levelUp
    case levelAlreadyUp
    case levelNotUp
    case levelsComplete
}

class PlayerLevel: ObservableObject {
    
    @Published var currentLevels = [String: Int]()
    
    init() {
        
        guard let playerGameLevels = UserDefaults.getPlayerLevel() else {
            
            initialLevels()
            
            return
            
        }
        self.currentLevels = playerGameLevels
    }
        
    func getCurrentLevel(for gameType: GameList.GameType) -> Int {
        
        currentLevels[gameType.rawValue] ?? 1
    }
    
    
    @discardableResult
    func updateLevel(for gameType: GameList.GameType, playingLevel: Int, with score: Int) -> LevelStatus {
        
        let currentLevel = getCurrentLevel(for: gameType)
        
        if score > MathForKids.levelUnlockingScore {
            
            if playingLevel == currentLevel && gameType.numberOfLevels > playingLevel {
                
                currentLevels[gameType.rawValue]! += 1
                UserDefaults.updatePlayerLevel(with: currentLevels)
                AudioPlayer.playCelebrationSound()
                return .levelUp
            }
                
            else {
                return playingLevel < currentLevel ? .levelAlreadyUp : .levelsComplete
            }
        }
            
        else {
            
            return playingLevel < currentLevel ? .levelAlreadyUp : .levelNotUp
        }
    }
    
    func initialLevels() {
        
        var levels: [String: Int] = [:]
        
        GameList.GameType.allCases.forEach { gameType in
            
            levels[gameType.rawValue] = 1
        }
        
        currentLevels = levels
        
        UserDefaults.updatePlayerLevel(with: currentLevels)
    }
}
